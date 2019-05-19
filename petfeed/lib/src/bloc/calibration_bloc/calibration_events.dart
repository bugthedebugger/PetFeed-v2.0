library calibration_events;

import 'package:built_value/built_value.dart';

part 'calibration_events.g.dart';

abstract class CalibrationEvents {}

abstract class StartHopper extends CalibrationEvents
    implements Built<StartHopper, StartHopperBuilder> {
  String get deviceID;
  String get token;
  String get deviceToken;

  StartHopper._();

  factory StartHopper([updates(StartHopperBuilder b)]) = _$StartHopper;
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
