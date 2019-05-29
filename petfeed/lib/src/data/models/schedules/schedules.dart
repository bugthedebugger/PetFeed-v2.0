library schedules;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/schedule/schedule.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'schedules.g.dart';

abstract class Schedules implements Built<Schedules, SchedulesBuilder> {
  BuiltList<Schedule> get schedules;

  Schedules._();

  factory Schedules([updates(SchedulesBuilder b)]) = _$Schedules;

  String toJson() {
    return json.encode(serializers.serializeWith(Schedules.serializer, this));
  }

  static Schedules fromJson(String jsonString) {
    return serializers.deserializeWith(
        Schedules.serializer, json.decode(jsonString));
  }

  static Serializer<Schedules> get serializer => _$schedulesSerializer;
}
