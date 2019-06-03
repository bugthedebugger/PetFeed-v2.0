// GENERATED CODE - DO NOT MODIFY BY HAND

part of calibration_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShutdownDevice extends ShutdownDevice {
  @override
  final String deviceID;
  @override
  final String token;
  @override
  final String deviceToken;

  factory _$ShutdownDevice([void Function(ShutdownDeviceBuilder) updates]) =>
      (new ShutdownDeviceBuilder()..update(updates)).build();

  _$ShutdownDevice._({this.deviceID, this.token, this.deviceToken})
      : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('ShutdownDevice', 'deviceID');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('ShutdownDevice', 'token');
    }
    if (deviceToken == null) {
      throw new BuiltValueNullFieldError('ShutdownDevice', 'deviceToken');
    }
  }

  @override
  ShutdownDevice rebuild(void Function(ShutdownDeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShutdownDeviceBuilder toBuilder() =>
      new ShutdownDeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShutdownDevice &&
        deviceID == other.deviceID &&
        token == other.token &&
        deviceToken == other.deviceToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, deviceID.hashCode), token.hashCode), deviceToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShutdownDevice')
          ..add('deviceID', deviceID)
          ..add('token', token)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class ShutdownDeviceBuilder
    implements Builder<ShutdownDevice, ShutdownDeviceBuilder> {
  _$ShutdownDevice _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  ShutdownDeviceBuilder();

  ShutdownDeviceBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _token = _$v.token;
      _deviceToken = _$v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShutdownDevice other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShutdownDevice;
  }

  @override
  void update(void Function(ShutdownDeviceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShutdownDevice build() {
    final _$result = _$v ??
        new _$ShutdownDevice._(
            deviceID: deviceID, token: token, deviceToken: deviceToken);
    replace(_$result);
    return _$result;
  }
}

class _$RestartDevice extends RestartDevice {
  @override
  final String deviceID;
  @override
  final String token;
  @override
  final String deviceToken;

  factory _$RestartDevice([void Function(RestartDeviceBuilder) updates]) =>
      (new RestartDeviceBuilder()..update(updates)).build();

  _$RestartDevice._({this.deviceID, this.token, this.deviceToken}) : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('RestartDevice', 'deviceID');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('RestartDevice', 'token');
    }
    if (deviceToken == null) {
      throw new BuiltValueNullFieldError('RestartDevice', 'deviceToken');
    }
  }

  @override
  RestartDevice rebuild(void Function(RestartDeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestartDeviceBuilder toBuilder() => new RestartDeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestartDevice &&
        deviceID == other.deviceID &&
        token == other.token &&
        deviceToken == other.deviceToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, deviceID.hashCode), token.hashCode), deviceToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RestartDevice')
          ..add('deviceID', deviceID)
          ..add('token', token)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class RestartDeviceBuilder
    implements Builder<RestartDevice, RestartDeviceBuilder> {
  _$RestartDevice _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  RestartDeviceBuilder();

  RestartDeviceBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _token = _$v.token;
      _deviceToken = _$v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestartDevice other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RestartDevice;
  }

  @override
  void update(void Function(RestartDeviceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RestartDevice build() {
    final _$result = _$v ??
        new _$RestartDevice._(
            deviceID: deviceID, token: token, deviceToken: deviceToken);
    replace(_$result);
    return _$result;
  }
}

class _$StartHopper extends StartHopper {
  @override
  final String deviceID;
  @override
  final String token;
  @override
  final String deviceToken;

  factory _$StartHopper([void Function(StartHopperBuilder) updates]) =>
      (new StartHopperBuilder()..update(updates)).build();

  _$StartHopper._({this.deviceID, this.token, this.deviceToken}) : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('StartHopper', 'deviceID');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('StartHopper', 'token');
    }
    if (deviceToken == null) {
      throw new BuiltValueNullFieldError('StartHopper', 'deviceToken');
    }
  }

  @override
  StartHopper rebuild(void Function(StartHopperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartHopperBuilder toBuilder() => new StartHopperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartHopper &&
        deviceID == other.deviceID &&
        token == other.token &&
        deviceToken == other.deviceToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, deviceID.hashCode), token.hashCode), deviceToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StartHopper')
          ..add('deviceID', deviceID)
          ..add('token', token)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class StartHopperBuilder implements Builder<StartHopper, StartHopperBuilder> {
  _$StartHopper _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  StartHopperBuilder();

  StartHopperBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _token = _$v.token;
      _deviceToken = _$v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StartHopper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StartHopper;
  }

  @override
  void update(void Function(StartHopperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StartHopper build() {
    final _$result = _$v ??
        new _$StartHopper._(
            deviceID: deviceID, token: token, deviceToken: deviceToken);
    replace(_$result);
    return _$result;
  }
}

class _$ReverseHopper extends ReverseHopper {
  @override
  final String deviceID;
  @override
  final String token;
  @override
  final String deviceToken;

  factory _$ReverseHopper([void Function(ReverseHopperBuilder) updates]) =>
      (new ReverseHopperBuilder()..update(updates)).build();

  _$ReverseHopper._({this.deviceID, this.token, this.deviceToken}) : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('ReverseHopper', 'deviceID');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('ReverseHopper', 'token');
    }
    if (deviceToken == null) {
      throw new BuiltValueNullFieldError('ReverseHopper', 'deviceToken');
    }
  }

  @override
  ReverseHopper rebuild(void Function(ReverseHopperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReverseHopperBuilder toBuilder() => new ReverseHopperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReverseHopper &&
        deviceID == other.deviceID &&
        token == other.token &&
        deviceToken == other.deviceToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, deviceID.hashCode), token.hashCode), deviceToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReverseHopper')
          ..add('deviceID', deviceID)
          ..add('token', token)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class ReverseHopperBuilder
    implements Builder<ReverseHopper, ReverseHopperBuilder> {
  _$ReverseHopper _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  ReverseHopperBuilder();

  ReverseHopperBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _token = _$v.token;
      _deviceToken = _$v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReverseHopper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReverseHopper;
  }

  @override
  void update(void Function(ReverseHopperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReverseHopper build() {
    final _$result = _$v ??
        new _$ReverseHopper._(
            deviceID: deviceID, token: token, deviceToken: deviceToken);
    replace(_$result);
    return _$result;
  }
}

class _$StopHopper extends StopHopper {
  @override
  final String deviceID;
  @override
  final String token;
  @override
  final String deviceToken;

  factory _$StopHopper([void Function(StopHopperBuilder) updates]) =>
      (new StopHopperBuilder()..update(updates)).build();

  _$StopHopper._({this.deviceID, this.token, this.deviceToken}) : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('StopHopper', 'deviceID');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('StopHopper', 'token');
    }
    if (deviceToken == null) {
      throw new BuiltValueNullFieldError('StopHopper', 'deviceToken');
    }
  }

  @override
  StopHopper rebuild(void Function(StopHopperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StopHopperBuilder toBuilder() => new StopHopperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StopHopper &&
        deviceID == other.deviceID &&
        token == other.token &&
        deviceToken == other.deviceToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, deviceID.hashCode), token.hashCode), deviceToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StopHopper')
          ..add('deviceID', deviceID)
          ..add('token', token)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class StopHopperBuilder implements Builder<StopHopper, StopHopperBuilder> {
  _$StopHopper _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  StopHopperBuilder();

  StopHopperBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _token = _$v.token;
      _deviceToken = _$v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StopHopper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StopHopper;
  }

  @override
  void update(void Function(StopHopperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StopHopper build() {
    final _$result = _$v ??
        new _$StopHopper._(
            deviceID: deviceID, token: token, deviceToken: deviceToken);
    replace(_$result);
    return _$result;
  }
}

class _$CalibrationSuccess extends CalibrationSuccess {
  factory _$CalibrationSuccess(
          [void Function(CalibrationSuccessBuilder) updates]) =>
      (new CalibrationSuccessBuilder()..update(updates)).build();

  _$CalibrationSuccess._() : super._();

  @override
  CalibrationSuccess rebuild(
          void Function(CalibrationSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalibrationSuccessBuilder toBuilder() =>
      new CalibrationSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalibrationSuccess;
  }

  @override
  int get hashCode {
    return 727886211;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('CalibrationSuccess').toString();
  }
}

class CalibrationSuccessBuilder
    implements Builder<CalibrationSuccess, CalibrationSuccessBuilder> {
  _$CalibrationSuccess _$v;

  CalibrationSuccessBuilder();

  @override
  void replace(CalibrationSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CalibrationSuccess;
  }

  @override
  void update(void Function(CalibrationSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CalibrationSuccess build() {
    final _$result = _$v ?? new _$CalibrationSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$CalibrationError extends CalibrationError {
  @override
  final String message;

  factory _$CalibrationError(
          [void Function(CalibrationErrorBuilder) updates]) =>
      (new CalibrationErrorBuilder()..update(updates)).build();

  _$CalibrationError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('CalibrationError', 'message');
    }
  }

  @override
  CalibrationError rebuild(void Function(CalibrationErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalibrationErrorBuilder toBuilder() =>
      new CalibrationErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalibrationError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CalibrationError')
          ..add('message', message))
        .toString();
  }
}

class CalibrationErrorBuilder
    implements Builder<CalibrationError, CalibrationErrorBuilder> {
  _$CalibrationError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  CalibrationErrorBuilder();

  CalibrationErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalibrationError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CalibrationError;
  }

  @override
  void update(void Function(CalibrationErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CalibrationError build() {
    final _$result = _$v ?? new _$CalibrationError._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
