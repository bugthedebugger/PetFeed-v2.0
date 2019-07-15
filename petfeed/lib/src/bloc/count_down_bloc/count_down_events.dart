library count_down_events;

import 'package:built_value/built_value.dart';

part 'count_down_events.g.dart';

abstract class TimerEvents {}

abstract class TimerStart extends TimerEvents
    implements Built<TimerStart, TimerStartBuilder> {
  DateTime get date;

  TimerStart._();

  factory TimerStart([updates(TimerStartBuilder b)]) = _$TimerStart;
}

abstract class TimerStop extends TimerEvents
    implements Built<TimerStop, TimerStopBuilder> {
  TimerStop._();

  factory TimerStop([updates(TimerStopBuilder b)]) = _$TimerStop;
}

abstract class TimerReached extends TimerEvents
    implements Built<TimerReached, TimerReachedBuilder> {
  TimerReached._();

  factory TimerReached([updates(TimerReachedBuilder b)]) = _$TimerReached;
}
