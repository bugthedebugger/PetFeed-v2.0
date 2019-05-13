library register_events;

import 'package:built_value/built_value.dart';

part 'register_events.g.dart';

abstract class RegisterEvents {}

abstract class InitializingRegistration extends RegisterEvents
    implements
        Built<InitializingRegistration, InitializingRegistrationBuilder> {
  InitializingRegistration._();

  String get name;
  String get email;
  String get password;

  factory InitializingRegistration(
          [updates(InitializingRegistrationBuilder b)]) =
      _$InitializingRegistration;
}

abstract class RegistrationSuccessful extends RegisterEvents
    implements Built<RegistrationSuccessful, RegistrationSuccessfulBuilder> {
  RegistrationSuccessful._();

  factory RegistrationSuccessful([updates(RegistrationSuccessfulBuilder b)]) =
      _$RegistrationSuccessful;
}

abstract class RegistrationError extends RegisterEvents
    implements Built<RegistrationError, RegistrationErrorBuilder> {
  String get message;

  RegistrationError._();

  factory RegistrationError([updates(RegistrationErrorBuilder b)]) =
      _$RegistrationError;
}

abstract class SendVerificationEmail extends RegisterEvents
    implements Built<SendVerificationEmail, SendVerificationEmailBuilder> {
  String get email;
  String get password;

  SendVerificationEmail._();

  factory SendVerificationEmail([updates(SendVerificationEmailBuilder b)]) =
      _$SendVerificationEmail;
}
