library local_status;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'local_status.g.dart';

abstract class LocalStatus implements Built<LocalStatus, LocalStatusBuilder> {
  @nullable
  String get message;
  String get status;
  String get connection;
  @nullable
  double get remainig;

  LocalStatus._();

  factory LocalStatus([updates(LocalStatusBuilder b)]) = _$LocalStatus;

  String toJson() {
    return json.encode(serializers.serializeWith(LocalStatus.serializer, this));
  }

  static LocalStatus fromJson(String jsonString) {
    return serializers.deserializeWith(
        LocalStatus.serializer, json.decode(jsonString));
  }

  static Serializer<LocalStatus> get serializer => _$localStatusSerializer;
}
