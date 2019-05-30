library schedule_status;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'schedule_status.g.dart';

abstract class ScheduleStatus
    implements Built<ScheduleStatus, ScheduleStatusBuilder> {
  String get connection;
  String get message;
  String get status;

  ScheduleStatus._();

  factory ScheduleStatus([updates(ScheduleStatusBuilder b)]) = _$ScheduleStatus;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ScheduleStatus.serializer, this));
  }

  static ScheduleStatus fromJson(String jsonString) {
    return serializers.deserializeWith(
        ScheduleStatus.serializer, json.decode(jsonString));
  }

  static Serializer<ScheduleStatus> get serializer =>
      _$scheduleStatusSerializer;
}
