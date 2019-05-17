library device_register_bloc_events;

import 'package:built_value/built_value.dart';

part 'device_register_bloc_events.g.dart';

abstract class DeviceRegisterEvents {}

abstract class DeviceRegisterInitiated extends DeviceRegisterEvents
    implements Built<DeviceRegisterInitiated, DeviceRegisterInitiatedBuilder> {
  String get deviceID;
  String get password;

  DeviceRegisterInitiated._();

  factory DeviceRegisterInitiated([updates(DeviceRegisterInitiatedBuilder b)]) =
      _$DeviceRegisterInitiated;
}

abstract class DeviceRegisterSuccess extends DeviceRegisterEvents
    implements Built<DeviceRegisterSuccess, DeviceRegisterSuccessBuilder> {
  DeviceRegisterSuccess._();

  factory DeviceRegisterSuccess([updates(DeviceRegisterSuccessBuilder b)]) =
      _$DeviceRegisterSuccess;
}

abstract class DeviceRegisterError extends DeviceRegisterEvents
    implements Built<DeviceRegisterError, DeviceRegisterErrorBuilder> {
  String get message;

  DeviceRegisterError._();

  factory DeviceRegisterError([updates(DeviceRegisterErrorBuilder b)]) =
      _$DeviceRegisterError;
}

abstract class SendRegisterToServer extends DeviceRegisterEvents
    implements Built<SendRegisterToServer, SendRegisterToServerBuilder> {
  String get deviceID;
  String get password;

  SendRegisterToServer._();

  factory SendRegisterToServer([updates(SendRegisterToServerBuilder b)]) =
      _$SendRegisterToServer;
}
