library wifi_setup_events;

import 'package:built_value/built_value.dart';

part 'wifi_setup_events.g.dart';

abstract class WifiSetupEvents {}

abstract class WifiSetupInitialized extends WifiSetupEvents
    implements Built<WifiSetupInitialized, WifiSetupInitializedBuilder> {
  String get ssid;
  String get key;

  WifiSetupInitialized._();

  factory WifiSetupInitialized([updates(WifiSetupInitializedBuilder b)]) =
      _$WifiSetupInitialized;
}

abstract class WifiSetupSuccess extends WifiSetupEvents
    implements Built<WifiSetupSuccess, WifiSetupSuccessBuilder> {
  WifiSetupSuccess._();

  factory WifiSetupSuccess([updates(WifiSetupSuccessBuilder b)]) =
      _$WifiSetupSuccess;
}

abstract class WifiSetupFailed extends WifiSetupEvents
    implements Built<WifiSetupFailed, WifiSetupFailedBuilder> {
  String get message;

  WifiSetupFailed._();

  factory WifiSetupFailed([updates(WifiSetupFailedBuilder b)]) =
      _$WifiSetupFailed;
}
