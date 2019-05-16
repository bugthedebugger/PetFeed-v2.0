// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitializedLogin extends InitializedLogin {
  @override
  final String email;
  @override
  final String password;

  factory _$InitializedLogin(
          [void Function(InitializedLoginBuilder) updates]) =>
      (new InitializedLoginBuilder()..update(updates)).build();

  _$InitializedLogin._({this.email, this.password}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('InitializedLogin', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('InitializedLogin', 'password');
    }
  }

  @override
  InitializedLogin rebuild(void Function(InitializedLoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitializedLoginBuilder toBuilder() =>
      new InitializedLoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitializedLogin &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitializedLogin')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class InitializedLoginBuilder
    implements Builder<InitializedLogin, InitializedLoginBuilder> {
  _$InitializedLogin _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  InitializedLoginBuilder();

  InitializedLoginBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitializedLogin other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitializedLogin;
  }

  @override
  void update(void Function(InitializedLoginBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitializedLogin build() {
    final _$result =
        _$v ?? new _$InitializedLogin._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

class _$LoginSuccessful extends LoginSuccessful {
  factory _$LoginSuccessful([void Function(LoginSuccessfulBuilder) updates]) =>
      (new LoginSuccessfulBuilder()..update(updates)).build();

  _$LoginSuccessful._() : super._();

  @override
  LoginSuccessful rebuild(void Function(LoginSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginSuccessfulBuilder toBuilder() =>
      new LoginSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginSuccessful;
  }

  @override
  int get hashCode {
    return 996779657;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoginSuccessful').toString();
  }
}

class LoginSuccessfulBuilder
    implements Builder<LoginSuccessful, LoginSuccessfulBuilder> {
  _$LoginSuccessful _$v;

  LoginSuccessfulBuilder();

  @override
  void replace(LoginSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginSuccessful;
  }

  @override
  void update(void Function(LoginSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginSuccessful build() {
    final _$result = _$v ?? new _$LoginSuccessful._();
    replace(_$result);
    return _$result;
  }
}

class _$LoginError extends LoginError {
  @override
  final String message;

  factory _$LoginError([void Function(LoginErrorBuilder) updates]) =>
      (new LoginErrorBuilder()..update(updates)).build();

  _$LoginError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('LoginError', 'message');
    }
  }

  @override
  LoginError rebuild(void Function(LoginErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginErrorBuilder toBuilder() => new LoginErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginError')..add('message', message))
        .toString();
  }
}

class LoginErrorBuilder implements Builder<LoginError, LoginErrorBuilder> {
  _$LoginError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  LoginErrorBuilder();

  LoginErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginError;
  }

  @override
  void update(void Function(LoginErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginError build() {
    final _$result = _$v ?? new _$LoginError._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$ResendVerification extends ResendVerification {
  @override
  final String email;
  @override
  final String password;

  factory _$ResendVerification(
          [void Function(ResendVerificationBuilder) updates]) =>
      (new ResendVerificationBuilder()..update(updates)).build();

  _$ResendVerification._({this.email, this.password}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('ResendVerification', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('ResendVerification', 'password');
    }
  }

  @override
  ResendVerification rebuild(
          void Function(ResendVerificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResendVerificationBuilder toBuilder() =>
      new ResendVerificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResendVerification &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResendVerification')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class ResendVerificationBuilder
    implements Builder<ResendVerification, ResendVerificationBuilder> {
  _$ResendVerification _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  ResendVerificationBuilder();

  ResendVerificationBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResendVerification other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResendVerification;
  }

  @override
  void update(void Function(ResendVerificationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResendVerification build() {
    final _$result =
        _$v ?? new _$ResendVerification._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

class _$VerificationSent extends VerificationSent {
  factory _$VerificationSent(
          [void Function(VerificationSentBuilder) updates]) =>
      (new VerificationSentBuilder()..update(updates)).build();

  _$VerificationSent._() : super._();

  @override
  VerificationSent rebuild(void Function(VerificationSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationSentBuilder toBuilder() =>
      new VerificationSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationSent;
  }

  @override
  int get hashCode {
    return 797515737;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('VerificationSent').toString();
  }
}

class VerificationSentBuilder
    implements Builder<VerificationSent, VerificationSentBuilder> {
  _$VerificationSent _$v;

  VerificationSentBuilder();

  @override
  void replace(VerificationSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VerificationSent;
  }

  @override
  void update(void Function(VerificationSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VerificationSent build() {
    final _$result = _$v ?? new _$VerificationSent._();
    replace(_$result);
    return _$result;
  }
}

class _$VerificationError extends VerificationError {
  @override
  final String message;

  factory _$VerificationError(
          [void Function(VerificationErrorBuilder) updates]) =>
      (new VerificationErrorBuilder()..update(updates)).build();

  _$VerificationError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('VerificationError', 'message');
    }
  }

  @override
  VerificationError rebuild(void Function(VerificationErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationErrorBuilder toBuilder() =>
      new VerificationErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VerificationError')
          ..add('message', message))
        .toString();
  }
}

class VerificationErrorBuilder
    implements Builder<VerificationError, VerificationErrorBuilder> {
  _$VerificationError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  VerificationErrorBuilder();

  VerificationErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VerificationError;
  }

  @override
  void update(void Function(VerificationErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VerificationError build() {
    final _$result = _$v ?? new _$VerificationError._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
