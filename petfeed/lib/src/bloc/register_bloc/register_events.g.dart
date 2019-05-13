// GENERATED CODE - DO NOT MODIFY BY HAND

part of register_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitializingRegistration extends InitializingRegistration {
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  factory _$InitializingRegistration(
          [void Function(InitializingRegistrationBuilder) updates]) =>
      (new InitializingRegistrationBuilder()..update(updates)).build();

  _$InitializingRegistration._({this.name, this.email, this.password})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('InitializingRegistration', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('InitializingRegistration', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError(
          'InitializingRegistration', 'password');
    }
  }

  @override
  InitializingRegistration rebuild(
          void Function(InitializingRegistrationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitializingRegistrationBuilder toBuilder() =>
      new InitializingRegistrationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitializingRegistration &&
        name == other.name &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitializingRegistration')
          ..add('name', name)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class InitializingRegistrationBuilder
    implements
        Builder<InitializingRegistration, InitializingRegistrationBuilder> {
  _$InitializingRegistration _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  InitializingRegistrationBuilder();

  InitializingRegistrationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitializingRegistration other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitializingRegistration;
  }

  @override
  void update(void Function(InitializingRegistrationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitializingRegistration build() {
    final _$result = _$v ??
        new _$InitializingRegistration._(
            name: name, email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

class _$RegistrationSuccessful extends RegistrationSuccessful {
  factory _$RegistrationSuccessful(
          [void Function(RegistrationSuccessfulBuilder) updates]) =>
      (new RegistrationSuccessfulBuilder()..update(updates)).build();

  _$RegistrationSuccessful._() : super._();

  @override
  RegistrationSuccessful rebuild(
          void Function(RegistrationSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationSuccessfulBuilder toBuilder() =>
      new RegistrationSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationSuccessful;
  }

  @override
  int get hashCode {
    return 1026000461;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('RegistrationSuccessful').toString();
  }
}

class RegistrationSuccessfulBuilder
    implements Builder<RegistrationSuccessful, RegistrationSuccessfulBuilder> {
  _$RegistrationSuccessful _$v;

  RegistrationSuccessfulBuilder();

  @override
  void replace(RegistrationSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegistrationSuccessful;
  }

  @override
  void update(void Function(RegistrationSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegistrationSuccessful build() {
    final _$result = _$v ?? new _$RegistrationSuccessful._();
    replace(_$result);
    return _$result;
  }
}

class _$RegistrationError extends RegistrationError {
  @override
  final String message;

  factory _$RegistrationError(
          [void Function(RegistrationErrorBuilder) updates]) =>
      (new RegistrationErrorBuilder()..update(updates)).build();

  _$RegistrationError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('RegistrationError', 'message');
    }
  }

  @override
  RegistrationError rebuild(void Function(RegistrationErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationErrorBuilder toBuilder() =>
      new RegistrationErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegistrationError')
          ..add('message', message))
        .toString();
  }
}

class RegistrationErrorBuilder
    implements Builder<RegistrationError, RegistrationErrorBuilder> {
  _$RegistrationError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  RegistrationErrorBuilder();

  RegistrationErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegistrationError;
  }

  @override
  void update(void Function(RegistrationErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegistrationError build() {
    final _$result = _$v ?? new _$RegistrationError._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$SendVerificationEmail extends SendVerificationEmail {
  @override
  final String email;
  @override
  final String password;

  factory _$SendVerificationEmail(
          [void Function(SendVerificationEmailBuilder) updates]) =>
      (new SendVerificationEmailBuilder()..update(updates)).build();

  _$SendVerificationEmail._({this.email, this.password}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('SendVerificationEmail', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('SendVerificationEmail', 'password');
    }
  }

  @override
  SendVerificationEmail rebuild(
          void Function(SendVerificationEmailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendVerificationEmailBuilder toBuilder() =>
      new SendVerificationEmailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendVerificationEmail &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendVerificationEmail')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class SendVerificationEmailBuilder
    implements Builder<SendVerificationEmail, SendVerificationEmailBuilder> {
  _$SendVerificationEmail _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  SendVerificationEmailBuilder();

  SendVerificationEmailBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendVerificationEmail other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SendVerificationEmail;
  }

  @override
  void update(void Function(SendVerificationEmailBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendVerificationEmail build() {
    final _$result =
        _$v ?? new _$SendVerificationEmail._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
