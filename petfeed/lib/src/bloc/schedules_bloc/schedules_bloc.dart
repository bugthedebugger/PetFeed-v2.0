import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_events.dart';
import 'package:petfeed/src/data/database/database_name.dart';
import 'package:petfeed/src/data/exceptions/device_not_found_exception.dart';
import 'package:petfeed/src/data/models/schedule/schedule.dart';
import 'package:petfeed/src/data/models/schedules/schedules.dart';
import 'package:petfeed/src/data/network/local/pi_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:sqflite/sqflite.dart';

class SchedulesBloc extends Bloc {
  final PiDataSource dataSource;
  final SharedPreferences preferences;
  String path;

  SchedulesBloc(this.dataSource, this.preferences) {
    initDB();
    init();
  }

  void initDB() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, DATABASE_NAME);
  }

  StreamController<ScheduleEvents> _eventStreamController =
      StreamController<ScheduleEvents>.broadcast();
  Stream<ScheduleEvents> get eventStream => _eventStreamController.stream;
  Sink<ScheduleEvents> get _eventSink => _eventStreamController.sink;

  StreamController<Schedules> _dataStreamController =
      StreamController<Schedules>.broadcast();
  Stream<Schedules> get dataStream => _dataStreamController.stream;
  Sink<Schedules> get _dataSink => _dataStreamController.sink;

  void init() {
    _eventStreamController.stream.listen(_mapEventsToState);
  }

  void reinit() {
    // _eventStreamController
    this._eventStreamController = StreamController<ScheduleEvents>.broadcast();
    this._dataStreamController = StreamController<Schedules>.broadcast();
    init();
  }

  void _mapEventsToState(ScheduleEvents event) {
    if (event is AddSchedule) {
      _mapAddSchedule(event);
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
    } on DeviceNotFoundException catch (_) {
      dispatch(ScheduleError((b) => b..message = _.message));
    } catch (_) {
      dispatch(ScheduleError((b) => b..message = _.toString()));
    }
  }

  void addData(Schedules data) {
    _dataSink.add(data);
  }

  void dispatch(ScheduleEvents event) {
    if (_eventStreamController.isClosed) reinit();
    print('.................................');
    print(_eventStreamController.isClosed);
    print('.................................');
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
    _dataStreamController.close();
  }
}
