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

abstract class DeviceREgisterError extends DeviceRegisterEvents
    implements Built<DeviceREgisterError, DeviceREgisterErrorBuilder> {
  String get message;

  DeviceREgisterError._();

  factory DeviceREgisterError([updates(DeviceREgisterErrorBuilder b)]) =
      _$DeviceREgisterError;
}
