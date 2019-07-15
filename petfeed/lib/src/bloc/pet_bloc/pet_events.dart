library pet_events;

import 'package:built_value/built_value.dart';

part 'pet_events.g.dart';

abstract class PetEvents {}

abstract class PetRegisterInitiated extends PetEvents
    implements Built<PetRegisterInitiated, PetRegisterInitiatedBuilder> {
  String get token;
  String get name;
  String get type;
  @nullable
  double get weight;
  @nullable
  double get age;

  PetRegisterInitiated._();

  factory PetRegisterInitiated([updates(PetRegisterInitiatedBuilder b)]) =
      _$PetRegisterInitiated;
}

abstract class PetRegisterSuccessful extends PetEvents
    implements Built<PetRegisterSuccessful, PetRegisterSuccessfulBuilder> {
  PetRegisterSuccessful._();

  factory PetRegisterSuccessful([updates(PetRegisterSuccessfulBuilder b)]) =
      _$PetRegisterSuccessful;
}

abstract class PetRegisterError extends PetEvents
    implements Built<PetRegisterError, PetRegisterErrorBuilder> {
  String get message;

  PetRegisterError._();

  factory PetRegisterError([updates(PetRegisterErrorBuilder b)]) =
      _$PetRegisterError;
}
