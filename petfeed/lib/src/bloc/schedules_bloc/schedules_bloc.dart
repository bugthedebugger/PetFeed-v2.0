import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_events.dart';
import 'package:petfeed/src/data/database/database_name.dart';
import 'package:petfeed/src/data/database/schedules/schedules_provider.dart';
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
      // print(await provider.test());

    } on DeviceNotFoundException catch (_) {
      dispatch(ScheduleError((b) => b..message = _.message));
    } catch (_) {
      print(_);
      dispatch(ScheduleError((b) => b..message = _.toString()));
    }
  }

  void deleteAllSchedules() {
    dispatch(DeleteAllSchedules());
  }

  void _mapDeleteAllSchedules(DeleteAllSchedules event) async {
    try {
      await initDB();
      await provider.deleteAll();
      getSchedules();
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
      addData(data);
      dispatch(GetSchedulesSuccess());
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

  void dispatch(ScheduleEvents event) {
    if (_eventStreamController.isClosed) reinit();
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
    _dataStreamController.close();
  }
}
