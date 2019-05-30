library schedule;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'schedule.g.dart';

abstract class Schedule implements Built<Schedule, ScheduleBuilder> {
  BuiltList<String> get feedTimes;
  double get amount;
  BuiltList<String> get repeat;
  @nullable
  String get groupID;

  Schedule._();

  factory Schedule([updates(ScheduleBuilder b)]) = _$Schedule;

  String toJson() {
    return json.encode(serializers.serializeWith(Schedule.serializer, this));
  }

  static Schedule fromJson(String jsonString) {
    return serializers.deserializeWith(
        Schedule.serializer, json.decode(jsonString));
  }

  static Serializer<Schedule> get serializer => _$scheduleSerializer;
}
