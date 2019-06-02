import 'dart:async';
import 'package:path/path.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/count_down_bloc/count_down_events.dart';
import 'package:petfeed/src/data/database/database_name.dart';
import 'package:petfeed/src/data/database/schedules/schedules_provider.dart';
import 'package:sqflite/sqflite.dart';

class TimerBloc extends Bloc {
  final SchedulesProvider provider;
  String path;

  StreamController<Map<String, dynamic>> _dataStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get dataStream => _dataStreamController.stream;
  Sink<Map<String, dynamic>> get _dataSink => _dataStreamController.sink;

  StreamController<TimerEvents> _eventsStreamController =
      StreamController<TimerEvents>.broadcast();
  Stream<TimerEvents> get eventStream => _eventsStreamController.stream;
  Sink<TimerEvents> get _eventSink => _eventsStreamController.sink;

  TimerBloc(this.provider) {
    init();
  }

  void init() {
    _eventsStreamController.stream.listen(_mapEventsToState);
  }

  Future initDB() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, DATABASE_NAME);
    return await provider.open(path);
  }

  void _mapEventsToState(TimerEvents event) {
    if (event is TimerStart) {
      _mapTimerStart(event);
    }
  }

  void startTimer() async {
    await initDB();
    final DateTime date = await provider.getNextFeedTime();
    if (date == null)
      dispatch(TimerStart((b) => b..date = DateTime.now()));
    else
      dispatch(TimerStart((b) => b..date = date));
  }

  void _mapTimerStart(TimerStart event) async {
    Map<String, dynamic> data = Map<String, dynamic>();
    var diffInSecs;
    var min;
    var hour;
    var day;
    var sec;
    bool blink = false;

    Timer.periodic(Duration(seconds: 1), (timer) {
      diffInSecs = event.date.difference(DateTime.now()).inSeconds;
      min = diffInSecs ~/ 60;
      hour = min ~/ 60;
      day = hour ~/ 24;
      sec = diffInSecs % 60;

      min = min % 60;
      hour = hour % 24;
      blink = !blink;

      data = {
        'day1': day ~/ 10,
        'day2': day % 10,
        'hour1': hour ~/ 10,
        'hour2': hour % 10,
        'min1': min ~/ 10,
        'min2': min % 10,
        'second1': sec ~/ 10,
        'second2': sec % 10,
        'blink': blink,
      };

      if (event.date.difference(DateTime.now()).isNegative ||
          DateTime.now() == event.date) {
        addData(
          data = {
            'day1': 0,
            'day2': 0,
            'hour1': 0,
            'hour2': 0,
            'min1': 0,
            'min2': 0,
            'second1': 0,
            'second2': 0,
            'blink': blink,
          },
        );
        dispatch(TimerReached());
        timer.cancel();
        startTimer();
      }
      addData(data);
    });
  }

  void addData(Map<String, dynamic> data) {
    _dataSink.add(data);
  }

  void dispatch(TimerEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _dataStreamController.close();
    _eventsStreamController.close();
  }
}
