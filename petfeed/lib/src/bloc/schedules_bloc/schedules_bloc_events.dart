library schedules_bloc_events;

import 'package:built_value/built_value.dart';
import 'package:petfeed/src/data/models/schedules/schedules.dart';

part 'schedules_bloc_events.g.dart';

abstract class ScheduleEvents {}

abstract class AddSchedule extends ScheduleEvents
    implements Built<AddSchedule, AddScheduleBuilder> {
  AddSchedule._();

  Schedules get schedules;

  factory AddSchedule([updates(AddScheduleBuilder b)]) = _$AddSchedule;
}

abstract class ScheduleAddedSuccessfully extends ScheduleEvents
    implements
        Built<ScheduleAddedSuccessfully, ScheduleAddedSuccessfullyBuilder> {
  ScheduleAddedSuccessfully._();

  factory ScheduleAddedSuccessfully(
          [updates(ScheduleAddedSuccessfullyBuilder b)]) =
      _$ScheduleAddedSuccessfully;
}

abstract class ScheduleError extends ScheduleEvents
    implements Built<ScheduleError, ScheduleErrorBuilder> {
  String get message;

  ScheduleError._();

  factory ScheduleError([updates(ScheduleErrorBuilder b)]) = _$ScheduleError;
}

abstract class GetSchedules extends ScheduleEvents
    implements Built<GetSchedules, GetSchedulesBuilder> {
  GetSchedules._();

  factory GetSchedules([updates(GetSchedulesBuilder b)]) = _$GetSchedules;
}

abstract class GetSchedulesSuccess extends ScheduleEvents
    implements Built<GetSchedulesSuccess, GetSchedulesSuccessBuilder> {
  GetSchedulesSuccess._();

  factory GetSchedulesSuccess([updates(GetSchedulesSuccessBuilder b)]) =
      _$GetSchedulesSuccess;
}

abstract class DeleteAllSchedules extends ScheduleEvents
    implements Built<DeleteAllSchedules, DeleteAllSchedulesBuilder> {
  DeleteAllSchedules._();

  factory DeleteAllSchedules([updates(DeleteAllSchedulesBuilder b)]) =
      _$DeleteAllSchedules;
}
