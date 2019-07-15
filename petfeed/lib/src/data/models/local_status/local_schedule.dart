library local_schedule;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'local_schedule.g.dart';

abstract class LocalSchedule
    implements Built<LocalSchedule, LocalScheduleBuilder> {
  double get amount;
  String get day;
  int get feedTime;
  @BuiltValueField(wireName: 'groupId')
  String get groupID;
  @BuiltValueField(wireName: 'petId')
  int get petID;
  @BuiltValueField(wireName: 'uId')
  String get uID;

  LocalSchedule._();

  factory LocalSchedule([updates(LocalScheduleBuilder b)]) = _$LocalSchedule;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LocalSchedule.serializer, this));
  }

  static LocalSchedule fromJson(String jsonString) {
    return serializers.deserializeWith(
        LocalSchedule.serializer, json.decode(jsonString));
  }

  static Serializer<LocalSchedule> get serializer => _$localScheduleSerializer;
}
