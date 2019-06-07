import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/petfeed_bloc/petfeed_events.dart';
import 'package:petfeed/src/data/database/database_name.dart';
import 'package:petfeed/src/data/database/schedules/schedules_provider.dart';
import 'package:petfeed/src/data/models/pusher_events/pusher_treat.dart';
import 'package:petfeed/src/data/network/pusher/pusher.dart';
import 'package:petfeed/src/data/repository/device_repository.dart';
import 'package:petfeed/src/data/repository/pi_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetFeedBloc extends Bloc {
  final PiRepository piRepository;
  final Pusher pusher;
  final SharedPreferences preferences;
  final DeviceRepository deviceRepository;
  final SchedulesProvider provider;

  bool wifiConnected = false;
  bool pusherConnected = false;

  String path;

  PetFeedBloc(
    this.piRepository,
    this.pusher,
    this.preferences,
    this.deviceRepository,
    this.provider,
  ) {
    init();
    initDB();
  }

  // Stream controller for events
  StreamController<PetFeedEvents> _eventStreamController =
      StreamController<PetFeedEvents>.broadcast();
  Stream<PetFeedEvents> get eventStream => _eventStreamController.stream;
  Sink<PetFeedEvents> get _eventSink => _eventStreamController.sink;

  StreamController<Map<String, dynamic>> _pusherStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get pusherStream =>
      _pusherStreamController.stream;
  Sink<Map<String, dynamic>> get _pusherSink => _pusherStreamController.sink;

  StreamController<bool> _localConnectionController =
      StreamController<bool>.broadcast();
  Stream<bool> get localConnectionStream => _localConnectionController.stream;
  Sink<bool> get _localConnectionSink => _localConnectionController.sink;

  // FoodMeter StreamController
  StreamController<double> _foodMeterStreamController =
      StreamController<double>.broadcast();
  Stream<double> get foodMeterStream => _foodMeterStreamController.stream;
  Sink<double> get _foodMeterSink => _foodMeterStreamController.sink;

  Stream get pusherStatus => pusher.statusStream;
  Stream get pusherFoodMeter => pusher.foodMeterStream;
  Stream get pusherFeedCount => pusher.feedCountStream;

  StreamController<DateTime> _countDownController =
      StreamController<DateTime>.broadcast();
  Stream<DateTime> get countDownStream => _countDownController.stream;
  Sink<DateTime> get _countDownSink => _countDownController.sink;

  StreamController<int> _feedCountController =
      StreamController<int>.broadcast();
  Stream<int> get feedCountStream => _feedCountController.stream;
  Sink<int> get _feedCountSink => _feedCountController.sink;

  void init() async {
    _eventStreamController.stream.listen(_mapEventsToState);
    String accessToken = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    await pusher.connect(deviceID, accessToken);

    if (preferences.getDouble('foodMeter') == null)
      addFood(10.0);
    else
      addFood(preferences.getDouble('foodMeter'));

    pusherStatus.listen(_mapPusherStatus);
    pusherFoodMeter.listen(_mapFoodMeter);
    pusherFeedCount.listen(_mapFeedCount);
    dispatch(
      PetFeedInitialized((b) => b
        ..token = accessToken
        ..deviceID = deviceID),
    );
  }

  void _mapFeedCount(data) {
    Map<String, dynamic> mappedData = json.decode(data);
    addCount(mappedData['feedCount']);
  }

  Future initDB() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, DATABASE_NAME);
    return await provider.open(path);
  }

  void _mapEventsToState(PetFeedEvents event) {
    if (event is PetFeedInitialized) {
      _mapPetFeedInitialized(event);
    } else if (event is Treat) {
      _mapTreat(event);
    } else if (event is LocalDeviceNotFound) {
      _mapLocalDeviceNotFound(event);
    } else if (event is GetCountDown) {
      _mapGetCountDown(event);
    }
  }

  void getCountDown() {
    dispatch(GetCountDown());
  }

  void _mapGetCountDown(GetCountDown event) async {
    try {
      await initDB();
      final date = await provider.getNextFeedTime();
      addCountDown(date);
      print(date);
    } catch (_) {
      dispatch(
        PetFeedError((b) => b..message = _.toString()),
      );
    }
  }

  void _mapFoodMeter(data) {
    Map<String, dynamic> mappedData = json.decode(data);
    addFood(mappedData['amount']);
  }

  void _mapLocalDeviceNotFound(LocalDeviceNotFound event) {
    addLocalConnection(false);
  }

  void treat({@required double amount}) {
    String deviceToken = preferences.get('deviceToken');
    dispatch(
      Treat((b) => b
        ..deviceToken = deviceToken
        ..amount = amount),
    );
  }

  void _mapTreat(Treat event) async {
    try {
      if (wifiConnected) {
        final response = await piRepository.treat(
          deviceToken: event.deviceToken,
          amount: event.amount,
        );
        addCount(response.feedCount);
      } else if (pusherConnected) {
        PusherTreat treat = PusherTreat(data: {
          'accessToken': event.deviceToken,
          'amount': event.amount,
        });
        pusher.trigger(treat);
      }
    } catch (_) {
      dispatch(
        PetFeedError((b) => b..message = _.toString()),
      );
    }
  }

  void _mapPusherStatus(data) {
    Map<String, dynamic> mappedData = json.decode(data);
    print('inside map pusher status');
    try {
      if (mappedData['status'] == 'online') {
        pusherConnected = true;
        addData(mappedData);
      } else {
        dispatch(
          PetFeedError((b) => b..message = 'Something wen\'t wrong.'),
        );
      }
    } catch (_) {
      dispatch(
        PetFeedError((b) => b..message = _.toString()),
      );
    }
  }

  void _mapPetFeedInitialized(PetFeedInitialized event) async {
    try {
      String accessToken = preferences.get('token');
      String deviceID = preferences.get('deviceID');
      pusher.pusherConnection();
      await deviceRepository.getStatus(
        deviceID: deviceID,
        token: accessToken,
      );
      wifiConnected = await piRepository.getStatus();
      if (wifiConnected) {
        final response = await piRepository.deviceStatus();
        addCount(response.feedCount);
        addLocalConnection(true);
        dispatch(LocalDeviceFound());
      } else {
        addLocalConnection(false);
        dispatch(LocalDeviceNotFound());
        addCount(0);
      }
    } catch (_) {
      dispatch(PetFeedError((b) => b..message = _.toString()));
    }
  }

  void addCount(int count) {
    _feedCountSink.add(count);
    preferences.setInt('feedCount', count);
  }

  void addFood(double amount) {
    _foodMeterSink.add(amount);
    preferences.setDouble('foodMeter', amount);
  }

  void addData(Map<String, dynamic> data) {
    _pusherSink.add(data);
  }

  void addLocalConnection(bool data) {
    _localConnectionSink.add(data);
  }

  void addCountDown(DateTime date) {
    _countDownSink.add(date);
  }

  void dispatch(PetFeedEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController?.close();
    _pusherStreamController?.close();
    _localConnectionController?.close();
    _foodMeterStreamController?.close();
    _countDownController?.close();
    _feedCountController?.close();
  }
}
