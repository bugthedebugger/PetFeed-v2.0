import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_events.dart';
import 'package:petfeed/src/data/database/database_name.dart';
import 'package:petfeed/src/data/database/schedules/schedules_provider.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/exceptions/device_not_found_exception.dart';
import 'package:petfeed/src/data/models/schedule/schedule.dart';
import 'package:petfeed/src/data/models/schedules/schedules.dart';
import 'package:petfeed/src/data/network/local/pi_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:petfeed/src/data/database/models/schedule.dart' as dbSchedule;
import 'dart:async';

import 'package:sqflite/sqflite.dart';

class SchedulesBloc extends Bloc {
  final PiDataSource dataSource;
  final SharedPreferences preferences;
  SchedulesProvider provider;
  String path;

  SchedulesBloc(this.dataSource, this.preferences, this.provider) {
    initDB();
    init();
  }

  Future initDB() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, DATABASE_NAME);
    return await provider.open(path);
  }

  StreamController<ScheduleEvents> _eventStreamController =
      StreamController<ScheduleEvents>.broadcast();
  Stream<ScheduleEvents> get eventStream => _eventStreamController.stream;
  Sink<ScheduleEvents> get _eventSink => _eventStreamController.sink;

  StreamController<bool> _recommendedClosedStreamController =
      StreamController<bool>.broadcast();
  Stream<bool> get recommendedClosedstream =>
      _recommendedClosedStreamController.stream;
  Sink<bool> get _recommendedSink => _recommendedClosedStreamController.sink;

  StreamController<Map<String, List<dbSchedule.Schedule>>>
      _dataStreamController =
      StreamController<Map<String, List<dbSchedule.Schedule>>>.broadcast();
  Stream<Map<String, List<dbSchedule.Schedule>>> get dataStream =>
      _dataStreamController.stream;
  Sink<Map<String, List<dbSchedule.Schedule>>> get _dataSink =>
      _dataStreamController.sink;

  void init() {
    _eventStreamController.stream.listen(_mapEventsToState);
  }

  void reinit() {
    // _eventStreamController
    this._eventStreamController = StreamController<ScheduleEvents>.broadcast();
    this._dataStreamController =
        StreamController<Map<String, List<dbSchedule.Schedule>>>.broadcast();
    // this.provider = kiwi.Container().resolve<SchedulesProvider>();
    init();
    initDB();
    // getSchedules();
  }

  void _mapEventsToState(ScheduleEvents event) {
    if (event is AddSchedule) {
      _mapAddSchedule(event);
    } else if (event is GetSchedules) {
      _mapGetSchedules(event);
    } else if (event is DeleteAllSchedules) {
      _mapDeleteAllSchedules(event);
    } else if (event is ApplyRecommended) {
      _mapApplyRecommended(event);
    }
  }

  void applyRecommendedClosed() {
    preferences.setBool('close', true);
    addRecommended(preferences.get('close'));
    dispatch(ApplyRecommendedClosed());
  }

  void applyRecommended({
    @required List<String> feedTimes,
    @required double amount,
    @required List<String> repeat,
  }) {
    String deviceToken = preferences.getString('deviceToken');
    int petID = preferences.getInt('petID');
    Schedule schedule = Schedule(
      (b) => b
        ..amount = amount
        ..feedTimes = ListBuilder<String>(feedTimes)
        ..repeat = ListBuilder<String>(repeat),
    );
    Schedules schedules = Schedules(
      (b) => b
        ..schedules.replace([schedule])
        ..accessToken = deviceToken
        ..petId = petID,
    );
    dispatch(ApplyRecommended((b) => b..schedules.replace(schedules)));
  }

  void _mapApplyRecommended(event) async {
    try {
      final response = await dataSource.addSchedule(schedules: event.schedules);
      final convertedResponse = json.decode(response.toJson());
      var convertedSchedules = convertedResponse['schedules'];

      List tempList = List();
      tempList.addAll(convertedSchedules);

      List<dbSchedule.Schedule> schedules = List<dbSchedule.Schedule>();

      for (int i = 0; i < tempList.length; i++) {
        var temp = Map<String, dynamic>.from(tempList[i]);
        var a = dbSchedule.Schedule.fromMap(temp);
        schedules.add(a);
      }

      await provider.insertAll(schedules);
      await Future.delayed(Duration(seconds: 2));
      dispatch(ApplyRecommendedSuccess());
      getSchedules();
      preferences.setBool('close', true);
      addRecommended(preferences.get('close'));
      // print(await provider.test());

    } on DeviceNotFoundException catch (_) {
      dispatch(ScheduleError((b) => b..message = _.message));
    } catch (_) {
      print(_);
      dispatch(ScheduleError((b) => b..message = _.toString()));
    }
  }

  void deleteAllSchedules() {
    String deviceToken = preferences.getString('deviceToken');
    dispatch(DeleteAllSchedules((b) => b..accessToken = deviceToken));
  }

  void _mapDeleteAllSchedules(DeleteAllSchedules event) async {
    try {
      final response =
          await dataSource.deleteSchedules(accessToken: event.accessToken);
      if (response.status == 'success') {
        await initDB();
        await provider.deleteAll();
        print('deleting schedules');
        preferences.setBool('close', false);
        addRecommended(preferences.get('close'));
      }
      getSchedules();
      dispatch(DeleteAllSchedulesSuccess());
    } on LocalException catch (_) {
      dispatch(ScheduleError((b) => b..message = _.message));
    } catch (_) {
      print(_);
      dispatch(ScheduleError((b) => b..message = _.toString()));
    }
  }

  void getSchedules() {
    dispatch(GetSchedules());
  }

  void _mapGetSchedules(GetSchedules event) async {
    try {
      await initDB();
      final data = await provider.getGroupedSchedules();
      print('get Schedules function: ');
      print(data);
      addData(data);
      dispatch(GetSchedulesSuccess());
      addRecommended(preferences.get('close'));
    } catch (_) {
      print(_);
      dispatch(ScheduleError((b) => b..message = _.toString()));
    }
  }

  void addSchedule({
    @required List<String> feedTimes,
    @required double amount,
    @required List<String> repeat,
  }) {
    String deviceToken = preferences.getString('deviceToken');
    int petID = preferences.getInt('petID');
    Schedule schedule = Schedule(
      (b) => b
        ..amount = amount
        ..feedTimes = ListBuilder<String>(feedTimes)
        ..repeat = ListBuilder<String>(repeat),
    );
    Schedules schedules = Schedules(
      (b) => b
        ..schedules.replace([schedule])
        ..accessToken = deviceToken
        ..petId = petID,
    );

    dispatch(AddSchedule((b) => b..schedules.replace(schedules)));
  }

  void _mapAddSchedule(AddSchedule event) async {
    try {
      final response = await dataSource.addSchedule(schedules: event.schedules);
      final convertedResponse = json.decode(response.toJson());
      var convertedSchedules = convertedResponse['schedules'];

      List tempList = List();
      tempList.addAll(convertedSchedules);

      List<dbSchedule.Schedule> schedules = List<dbSchedule.Schedule>();

      for (int i = 0; i < tempList.length; i++) {
        var temp = Map<String, dynamic>.from(tempList[i]);
        var a = dbSchedule.Schedule.fromMap(temp);
        schedules.add(a);
      }

      await provider.insertAll(schedules);
      await Future.delayed(Duration(seconds: 2));
      dispatch(ScheduleAddedSuccessfully());
      // print(await provider.test());

    } on DeviceNotFoundException catch (_) {
      dispatch(ScheduleError((b) => b..message = _.message));
    } catch (_) {
      print(_);
      dispatch(ScheduleError((b) => b..message = _.toString()));
    }
  }

  void addData(Map<String, List<dbSchedule.Schedule>> data) {
    _dataSink.add(data);
  }

  void addRecommended(bool data) {
    _recommendedSink.add(data);
  }

  void dispatch(ScheduleEvents event) {
    if (_eventStreamController.isClosed) reinit();
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
    _dataStreamController.close();
    _recommendedClosedStreamController.close();
  }
}
