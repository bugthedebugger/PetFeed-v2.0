library calibration_events;

import 'package:built_value/built_value.dart';

part 'calibration_events.g.dart';

abstract class CalibrationEvents {}

abstract class ShutdownDevice extends CalibrationEvents
    implements Built<ShutdownDevice, ShutdownDeviceBuilder> {
  String get deviceID;
  String get token;
  String get deviceToken;

  ShutdownDevice._();

  factory ShutdownDevice([updates(ShutdownDeviceBuilder b)]) = _$ShutdownDevice;
}

abstract class RestartDevice extends CalibrationEvents
    implements Built<RestartDevice, RestartDeviceBuilder> {
  String get deviceID;
  String get token;
  String get deviceToken;

  RestartDevice._();

  factory RestartDevice([updates(RestartDeviceBuilder b)]) = _$RestartDevice;
}

abstract class StartHopper extends CalibrationEvents
    implements Built<StartHopper, StartHopperBuilder> {
  String get deviceID;
  String get token;
  String get deviceToken;

  StartHopper._();

  factory StartHopper([updates(StartHopperBuilder b)]) = _$StartHopper;
}

abstract class ReverseHopper extends CalibrationEvents
    implements Built<ReverseHopper, ReverseHopperBuilder> {
  String get deviceID;
  String get token;
  String get deviceToken;

  ReverseHopper._();

  factory ReverseHopper([updates(ReverseHopperBuilder b)]) = _$ReverseHopper;
}

abstract class StopHopper extends CalibrationEvents
    implements Built<StopHopper, StopHopperBuilder> {
  String get deviceID;
  String get token;
  String get deviceToken;

  StopHopper._();

  factory StopHopper([updates(StopHopperBuilder b)]) = _$StopHopper;
}

abstract class CalibrationSuccess extends CalibrationEvents
    implements Built<CalibrationSuccess, CalibrationSuccessBuilder> {
  CalibrationSuccess._();

  factory CalibrationSuccess([updates(CalibrationSuccessBuilder b)]) =
      _$CalibrationSuccess;
}

abstract class CalibrationError extends CalibrationEvents
    implements Built<CalibrationError, CalibrationErrorBuilder> {
  String get message;

  CalibrationError._();

  factory CalibrationError([updates(CalibrationErrorBuilder b)]) =
      _$CalibrationError;
}
