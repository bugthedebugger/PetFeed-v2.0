library login_events;

import 'package:built_value/built_value.dart';

part 'login_events.g.dart';

abstract class LoginEvents {}

abstract class InitializedLogin extends LoginEvents
    implements Built<InitializedLogin, InitializedLoginBuilder> {
  String get email;
  String get password;

  InitializedLogin._();

  factory InitializedLogin([updates(InitializedLoginBuilder b)]) =
      _$InitializedLogin;
}

abstract class LoginSuccessful extends LoginEvents
    implements Built<LoginSuccessful, LoginSuccessfulBuilder> {
  // fields go here

  LoginSuccessful._();

  factory LoginSuccessful([updates(LoginSuccessfulBuilder b)]) =
      _$LoginSuccessful;
}

abstract class LoginError extends LoginEvents
    implements Built<LoginError, LoginErrorBuilder> {
  String get message;

  LoginError._();

  factory LoginError([updates(LoginErrorBuilder b)]) = _$LoginError;
}

abstract class ResendVerification extends LoginEvents
    implements Built<ResendVerification, ResendVerificationBuilder> {
  String get email;
  String get password;

  ResendVerification._();

  factory ResendVerification([updates(ResendVerificationBuilder b)]) =
      _$ResendVerification;
}

abstract class VerificationSent extends LoginEvents
    implements Built<VerificationSent, VerificationSentBuilder> {
  VerificationSent._();

  factory VerificationSent([updates(VerificationSentBuilder b)]) =
      _$VerificationSent;
}

abstract class VerificationError extends LoginEvents
    implements Built<VerificationError, VerificationErrorBuilder> {
  String get message;

  VerificationError._();

  factory VerificationError([updates(VerificationErrorBuilder b)]) =
      _$VerificationError;
}
