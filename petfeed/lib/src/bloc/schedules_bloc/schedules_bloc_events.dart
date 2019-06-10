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
  String get accessToken;

  factory DeleteAllSchedules([updates(DeleteAllSchedulesBuilder b)]) =
      _$DeleteAllSchedules;
}

abstract class ApplyRecommended extends ScheduleEvents
    implements Built<ApplyRecommended, ApplyRecommendedBuilder> {
  Schedules get schedules;

  ApplyRecommended._();

  factory ApplyRecommended([updates(ApplyRecommendedBuilder b)]) =
      _$ApplyRecommended;
}

abstract class ApplyRecommendedSuccess extends ScheduleEvents
    implements Built<ApplyRecommendedSuccess, ApplyRecommendedSuccessBuilder> {
  ApplyRecommendedSuccess._();

  factory ApplyRecommendedSuccess([updates(ApplyRecommendedSuccessBuilder b)]) =
      _$ApplyRecommendedSuccess;
}

abstract class ApplyRecommendedError extends ScheduleEvents
    implements Built<ApplyRecommendedError, ApplyRecommendedErrorBuilder> {
  String get message;

  ApplyRecommendedError._();

  factory ApplyRecommendedError([updates(ApplyRecommendedErrorBuilder b)]) =
      _$ApplyRecommendedError;
}

abstract class ApplyRecommendedClosed extends ScheduleEvents
    implements Built<ApplyRecommendedClosed, ApplyRecommendedClosedBuilder> {
  ApplyRecommendedClosed._();

  factory ApplyRecommendedClosed([updates(ApplyRecommendedClosedBuilder b)]) =
      _$ApplyRecommendedClosed;
}
