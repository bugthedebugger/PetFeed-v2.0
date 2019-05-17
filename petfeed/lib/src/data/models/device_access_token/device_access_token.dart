library device_access_token;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'device_access_token.g.dart';

abstract class DeviceAccessToken
    implements Built<DeviceAccessToken, DeviceAccessTokenBuilder> {
  String get message;
  String get deviceId;
  String get token;

  DeviceAccessToken._();

  factory DeviceAccessToken([updates(DeviceAccessTokenBuilder b)]) =
      _$DeviceAccessToken;

  String toJson() {
    return json
        .encode(serializers.serializeWith(DeviceAccessToken.serializer, this));
  }

  static DeviceAccessToken fromJson(String jsonString) {
    return serializers.deserializeWith(
        DeviceAccessToken.serializer, json.decode(jsonString));
  }

  static Serializer<DeviceAccessToken> get serializer =>
      _$deviceAccessTokenSerializer;
}
