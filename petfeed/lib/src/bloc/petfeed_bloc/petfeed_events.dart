library petfeed_events;

import 'package:built_value/built_value.dart';

part 'petfeed_events.g.dart';

abstract class PetFeedEvents {}

abstract class PetFeedInitialized extends PetFeedEvents
    implements Built<PetFeedInitialized, PetFeedInitializedBuilder> {
  String get deviceID;
  String get token;
  @nullable
  String get deviceToken;

  PetFeedInitialized._();

  factory PetFeedInitialized([updates(PetFeedInitializedBuilder b)]) =
      _$PetFeedInitialized;
}

abstract class LocalDeviceFound extends PetFeedEvents
    implements Built<LocalDeviceFound, LocalDeviceFoundBuilder> {
  LocalDeviceFound._();

  factory LocalDeviceFound([updates(LocalDeviceFoundBuilder b)]) =
      _$LocalDeviceFound;
}

abstract class LocalDeviceNotFound extends PetFeedEvents
    implements Built<LocalDeviceNotFound, LocalDeviceNotFoundBuilder> {
  LocalDeviceNotFound._();

  factory LocalDeviceNotFound([updates(LocalDeviceNotFoundBuilder b)]) =
      _$LocalDeviceNotFound;
}

abstract class Treat extends PetFeedEvents
    implements Built<Treat, TreatBuilder> {
  String get deviceToken;
  double get amount;

  Treat._();

  factory Treat([updates(TreatBuilder b)]) = _$Treat;
}

abstract class GlobalOnline extends PetFeedEvents
    implements Built<GlobalOnline, GlobalOnlineBuilder> {
  GlobalOnline._();

  factory GlobalOnline([updates(GlobalOnlineBuilder b)]) = _$GlobalOnline;
}

abstract class PetFeedError extends PetFeedEvents
    implements Built<PetFeedError, PetFeedErrorBuilder> {
  String get message;

  PetFeedError._();

  factory PetFeedError([updates(PetFeedErrorBuilder b)]) = _$PetFeedError;
}

abstract class GetCountDown extends PetFeedEvents
    implements Built<GetCountDown, GetCountDownBuilder> {
  GetCountDown._();

  factory GetCountDown([updates(GetCountDownBuilder b)]) = _$GetCountDown;
}

abstract class LogOut extends PetFeedEvents
    implements Built<LogOut, LogOutBuilder> {
  LogOut._();

  factory LogOut([updates(LogOutBuilder b)]) = _$LogOut;
}

abstract class LogOutSuccess extends PetFeedEvents
    implements Built<LogOutSuccess, LogOutSuccessBuilder> {
  LogOutSuccess._();

  factory LogOutSuccess([updates(LogOutSuccessBuilder b)]) = _$LogOutSuccess;
}
