import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/petfeed_bloc/petfeed_events.dart';
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

  bool wifiConnected = false;
  bool pusherConnected = false;

  PetFeedBloc(
    this.piRepository,
    this.pusher,
    this.preferences,
    this.deviceRepository,
  ) {
    init();
  }

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

  Stream get pusherStatus => pusher.statusStream;

  StreamSubscription _pusherStatusSub;

  void init() async {
    _eventStreamController.stream.listen(_mapEventsToState);
    String accessToken = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    await pusher.connect(deviceID, accessToken);
    _pusherStatusSub = pusherStatus.listen(_mapPusherStatus);
    dispatch(
      PetFeedInitialized((b) => b
        ..token = accessToken
        ..deviceID = deviceID),
    );
  }

  void _mapEventsToState(PetFeedEvents event) {
    if (event is PetFeedInitialized) {
      _mapPetFeedInitialized(event);
    } else if (event is Treat) {
      _mapTreat(event);
    }
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
        await piRepository.treat(
          deviceToken: event.deviceToken,
          amount: event.amount,
        );
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
      await deviceRepository.getStatus(
        deviceID: deviceID,
        token: accessToken,
      );
      wifiConnected = await piRepository.getStatus();
      if (wifiConnected) {
        addLocalConnection(true);
        dispatch(LocalDeviceFound());
      } else {
        addLocalConnection(false);
        dispatch(LocalDeviceNotFound());
      }
    } catch (_) {
      dispatch(PetFeedError((b) => b..message = _.toString()));
    }
  }

  void addData(Map<String, dynamic> data) {
    _pusherSink.add(data);
  }

  void addLocalConnection(bool data) {
    _localConnectionSink.add(data);
  }

  void dispatch(PetFeedEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _pusherStatusSub?.cancel();
    _eventStreamController?.close();
    _pusherStreamController?.close();
    _localConnectionController?.close();
  }
}
