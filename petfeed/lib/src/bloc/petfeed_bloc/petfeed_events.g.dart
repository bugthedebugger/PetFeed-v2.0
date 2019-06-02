// GENERATED CODE - DO NOT MODIFY BY HAND

part of petfeed_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PetFeedInitialized extends PetFeedInitialized {
  @override
  final String deviceID;
  @override
  final String token;
  @override
  final String deviceToken;

  factory _$PetFeedInitialized(
          [void Function(PetFeedInitializedBuilder) updates]) =>
      (new PetFeedInitializedBuilder()..update(updates)).build();

  _$PetFeedInitialized._({this.deviceID, this.token, this.deviceToken})
      : super._() {
    if (deviceID == null) {
      throw new BuiltValueNullFieldError('PetFeedInitialized', 'deviceID');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('PetFeedInitialized', 'token');
    }
  }

  @override
  PetFeedInitialized rebuild(
          void Function(PetFeedInitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetFeedInitializedBuilder toBuilder() =>
      new PetFeedInitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetFeedInitialized &&
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
    return (newBuiltValueToStringHelper('PetFeedInitialized')
          ..add('deviceID', deviceID)
          ..add('token', token)
          ..add('deviceToken', deviceToken))
        .toString();
  }
}

class PetFeedInitializedBuilder
    implements Builder<PetFeedInitialized, PetFeedInitializedBuilder> {
  _$PetFeedInitialized _$v;

  String _deviceID;
  String get deviceID => _$this._deviceID;
  set deviceID(String deviceID) => _$this._deviceID = deviceID;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  PetFeedInitializedBuilder();

  PetFeedInitializedBuilder get _$this {
    if (_$v != null) {
      _deviceID = _$v.deviceID;
      _token = _$v.token;
      _deviceToken = _$v.deviceToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetFeedInitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetFeedInitialized;
  }

  @override
  void update(void Function(PetFeedInitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetFeedInitialized build() {
    final _$result = _$v ??
        new _$PetFeedInitialized._(
            deviceID: deviceID, token: token, deviceToken: deviceToken);
    replace(_$result);
    return _$result;
  }
}

class _$LocalDeviceFound extends LocalDeviceFound {
  factory _$LocalDeviceFound(
          [void Function(LocalDeviceFoundBuilder) updates]) =>
      (new LocalDeviceFoundBuilder()..update(updates)).build();

  _$LocalDeviceFound._() : super._();

  @override
  LocalDeviceFound rebuild(void Function(LocalDeviceFoundBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocalDeviceFoundBuilder toBuilder() =>
      new LocalDeviceFoundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalDeviceFound;
  }

  @override
  int get hashCode {
    return 331892099;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LocalDeviceFound').toString();
  }
}

class LocalDeviceFoundBuilder
    implements Builder<LocalDeviceFound, LocalDeviceFoundBuilder> {
  _$LocalDeviceFound _$v;

  LocalDeviceFoundBuilder();

  @override
  void replace(LocalDeviceFound other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LocalDeviceFound;
  }

  @override
  void update(void Function(LocalDeviceFoundBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocalDeviceFound build() {
    final _$result = _$v ?? new _$LocalDeviceFound._();
    replace(_$result);
    return _$result;
  }
}

class _$LocalDeviceNotFound extends LocalDeviceNotFound {
  factory _$LocalDeviceNotFound(
          [void Function(LocalDeviceNotFoundBuilder) updates]) =>
      (new LocalDeviceNotFoundBuilder()..update(updates)).build();

  _$LocalDeviceNotFound._() : super._();

  @override
  LocalDeviceNotFound rebuild(
          void Function(LocalDeviceNotFoundBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocalDeviceNotFoundBuilder toBuilder() =>
      new LocalDeviceNotFoundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalDeviceNotFound;
  }

  @override
  int get hashCode {
    return 569498411;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LocalDeviceNotFound').toString();
  }
}

class LocalDeviceNotFoundBuilder
    implements Builder<LocalDeviceNotFound, LocalDeviceNotFoundBuilder> {
  _$LocalDeviceNotFound _$v;

  LocalDeviceNotFoundBuilder();

  @override
  void replace(LocalDeviceNotFound other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LocalDeviceNotFound;
  }

  @override
  void update(void Function(LocalDeviceNotFoundBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocalDeviceNotFound build() {
    final _$result = _$v ?? new _$LocalDeviceNotFound._();
    replace(_$result);
    return _$result;
  }
}

class _$Treat extends Treat {
  @override
  final String deviceToken;
  @override
  final double amount;

  factory _$Treat([void Function(TreatBuilder) updates]) =>
      (new TreatBuilder()..update(updates)).build();

  _$Treat._({this.deviceToken, this.amount}) : super._() {
    if (deviceToken == null) {
      throw new BuiltValueNullFieldError('Treat', 'deviceToken');
    }
    if (amount == null) {
      throw new BuiltValueNullFieldError('Treat', 'amount');
    }
  }

  @override
  Treat rebuild(void Function(TreatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TreatBuilder toBuilder() => new TreatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Treat &&
        deviceToken == other.deviceToken &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, deviceToken.hashCode), amount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Treat')
          ..add('deviceToken', deviceToken)
          ..add('amount', amount))
        .toString();
  }
}

class TreatBuilder implements Builder<Treat, TreatBuilder> {
  _$Treat _$v;

  String _deviceToken;
  String get deviceToken => _$this._deviceToken;
  set deviceToken(String deviceToken) => _$this._deviceToken = deviceToken;

  double _amount;
  double get amount => _$this._amount;
  set amount(double amount) => _$this._amount = amount;

  TreatBuilder();

  TreatBuilder get _$this {
    if (_$v != null) {
      _deviceToken = _$v.deviceToken;
      _amount = _$v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Treat other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Treat;
  }

  @override
  void update(void Function(TreatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Treat build() {
    final _$result =
        _$v ?? new _$Treat._(deviceToken: deviceToken, amount: amount);
    replace(_$result);
    return _$result;
  }
}

class _$GlobalOnline extends GlobalOnline {
  factory _$GlobalOnline([void Function(GlobalOnlineBuilder) updates]) =>
      (new GlobalOnlineBuilder()..update(updates)).build();

  _$GlobalOnline._() : super._();

  @override
  GlobalOnline rebuild(void Function(GlobalOnlineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalOnlineBuilder toBuilder() => new GlobalOnlineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalOnline;
  }

  @override
  int get hashCode {
    return 273239422;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GlobalOnline').toString();
  }
}

class GlobalOnlineBuilder
    implements Builder<GlobalOnline, GlobalOnlineBuilder> {
  _$GlobalOnline _$v;

  GlobalOnlineBuilder();

  @override
  void replace(GlobalOnline other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GlobalOnline;
  }

  @override
  void update(void Function(GlobalOnlineBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GlobalOnline build() {
    final _$result = _$v ?? new _$GlobalOnline._();
    replace(_$result);
    return _$result;
  }
}

class _$PetFeedError extends PetFeedError {
  @override
  final String message;

  factory _$PetFeedError([void Function(PetFeedErrorBuilder) updates]) =>
      (new PetFeedErrorBuilder()..update(updates)).build();

  _$PetFeedError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('PetFeedError', 'message');
    }
  }

  @override
  PetFeedError rebuild(void Function(PetFeedErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetFeedErrorBuilder toBuilder() => new PetFeedErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetFeedError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetFeedError')
          ..add('message', message))
        .toString();
  }
}

class PetFeedErrorBuilder
    implements Builder<PetFeedError, PetFeedErrorBuilder> {
  _$PetFeedError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  PetFeedErrorBuilder();

  PetFeedErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetFeedError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetFeedError;
  }

  @override
  void update(void Function(PetFeedErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetFeedError build() {
    final _$result = _$v ?? new _$PetFeedError._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$GetCountDown extends GetCountDown {
  factory _$GetCountDown([void Function(GetCountDownBuilder) updates]) =>
      (new GetCountDownBuilder()..update(updates)).build();

  _$GetCountDown._() : super._();

  @override
  GetCountDown rebuild(void Function(GetCountDownBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCountDownBuilder toBuilder() => new GetCountDownBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCountDown;
  }

  @override
  int get hashCode {
    return 129089286;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetCountDown').toString();
  }
}

class GetCountDownBuilder
    implements Builder<GetCountDown, GetCountDownBuilder> {
  _$GetCountDown _$v;

  GetCountDownBuilder();

  @override
  void replace(GetCountDown other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetCountDown;
  }

  @override
  void update(void Function(GetCountDownBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetCountDown build() {
    final _$result = _$v ?? new _$GetCountDown._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
