// GENERATED CODE - DO NOT MODIFY BY HAND

part of device_register_bloc_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeviceRegisterInitiated extends DeviceRegisterInitiated {
  @override
  final String deviceID;
  @override
  final String password;

  factory _$DeviceRegisterInitiated(
          [void Function(DeviceRegisterInitiatedBuilder) updates]) =>
      (new DeviceRegisterInitiatedBuilder()..update(updates)).build();

  _$DeviceRegisterInitiated._({this.deviceID, this.password}) : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('DeviceRegisterInitiated', 'deviceID');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('DeviceRegisterInitiated', 'password');
    }
  }

  @override
  DeviceRegisterInitiated rebuild(
          void Function(DeviceRegisterInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceRegisterInitiatedBuilder toBuilder() =>
      new DeviceRegisterInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceRegisterInitiated &&
        deviceID == other.deviceID &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deviceID.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceRegisterInitiated')
          ..add('deviceID', deviceID)
          ..add('password', password))
        .toString();
  }
}

class DeviceRegisterInitiatedBuilder
    implements
        Builder<DeviceRegisterInitiated, DeviceRegisterInitiatedBuilder> {
  _$DeviceRegisterInitiated _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  DeviceRegisterInitiatedBuilder();

  DeviceRegisterInitiatedBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceRegisterInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeviceRegisterInitiated;
  }

  @override
  void update(void Function(DeviceRegisterInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceRegisterInitiated build() {
    final _$result = _$v ??
        new _$DeviceRegisterInitiated._(deviceID: deviceID, password: password);
    replace(_$result);
    return _$result;
  }
}

class _$DeviceRegisterSuccess extends DeviceRegisterSuccess {
  factory _$DeviceRegisterSuccess(
          [void Function(DeviceRegisterSuccessBuilder) updates]) =>
      (new DeviceRegisterSuccessBuilder()..update(updates)).build();

  _$DeviceRegisterSuccess._() : super._();

  @override
  DeviceRegisterSuccess rebuild(
          void Function(DeviceRegisterSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceRegisterSuccessBuilder toBuilder() =>
      new DeviceRegisterSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceRegisterSuccess;
  }

  @override
  int get hashCode {
    return 879669385;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('DeviceRegisterSuccess').toString();
  }
}

class DeviceRegisterSuccessBuilder
    implements Builder<DeviceRegisterSuccess, DeviceRegisterSuccessBuilder> {
  _$DeviceRegisterSuccess _$v;

  DeviceRegisterSuccessBuilder();

  @override
  void replace(DeviceRegisterSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeviceRegisterSuccess;
  }

  @override
  void update(void Function(DeviceRegisterSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceRegisterSuccess build() {
    final _$result = _$v ?? new _$DeviceRegisterSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$DeviceRegisterError extends DeviceRegisterError {
  @override
  final String message;

  factory _$DeviceRegisterError(
          [void Function(DeviceRegisterErrorBuilder) updates]) =>
      (new DeviceRegisterErrorBuilder()..update(updates)).build();

  _$DeviceRegisterError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('DeviceRegisterError', 'message');
    }
  }

  @override
  DeviceRegisterError rebuild(
          void Function(DeviceRegisterErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceRegisterErrorBuilder toBuilder() =>
      new DeviceRegisterErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceRegisterError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceRegisterError')
          ..add('message', message))
        .toString();
  }
}

class DeviceRegisterErrorBuilder
    implements Builder<DeviceRegisterError, DeviceRegisterErrorBuilder> {
  _$DeviceRegisterError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  DeviceRegisterErrorBuilder();

  DeviceRegisterErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceRegisterError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeviceRegisterError;
  }

  @override
  void update(void Function(DeviceRegisterErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceRegisterError build() {
    final _$result = _$v ?? new _$DeviceRegisterError._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$SendRegisterToServer extends SendRegisterToServer {
  @override
  final String deviceID;
  @override
  final String password;

  factory _$SendRegisterToServer(
          [void Function(SendRegisterToServerBuilder) updates]) =>
      (new SendRegisterToServerBuilder()..update(updates)).build();

  _$SendRegisterToServer._({this.deviceID, this.password}) : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('SendRegisterToServer', 'deviceID');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('SendRegisterToServer', 'password');
    }
  }

  @override
  SendRegisterToServer rebuild(
          void Function(SendRegisterToServerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendRegisterToServerBuilder toBuilder() =>
      new SendRegisterToServerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendRegisterToServer &&
        deviceID == other.deviceID &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deviceID.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendRegisterToServer')
          ..add('deviceID', deviceID)
          ..add('password', password))
        .toString();
  }
}

class SendRegisterToServerBuilder
    implements Builder<SendRegisterToServer, SendRegisterToServerBuilder> {
  _$SendRegisterToServer _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  SendRegisterToServerBuilder();

  SendRegisterToServerBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendRegisterToServer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SendRegisterToServer;
  }

  @override
  void update(void Function(SendRegisterToServerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendRegisterToServer build() {
    final _$result = _$v ??
        new _$SendRegisterToServer._(deviceID: deviceID, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
