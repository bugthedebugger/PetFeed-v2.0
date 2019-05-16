// GENERATED CODE - DO NOT MODIFY BY HAND

part of wifi_setup_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WifiSetupInitialized extends WifiSetupInitialized {
  @override
  final String ssid;
  @override
  final String key;

  factory _$WifiSetupInitialized(
          [void Function(WifiSetupInitializedBuilder) updates]) =>
      (new WifiSetupInitializedBuilder()..update(updates)).build();

  _$WifiSetupInitialized._({this.ssid, this.key}) : super._() {
    if (ssid == null) {
      throw new BuiltValueNullFieldError('WifiSetupInitialized', 'ssid');
    }
    if (key == null) {
      throw new BuiltValueNullFieldError('WifiSetupInitialized', 'key');
    }
  }

  @override
  WifiSetupInitialized rebuild(
          void Function(WifiSetupInitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WifiSetupInitializedBuilder toBuilder() =>
      new WifiSetupInitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WifiSetupInitialized &&
        ssid == other.ssid &&
        key == other.key;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, ssid.hashCode), key.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WifiSetupInitialized')
          ..add('ssid', ssid)
          ..add('key', key))
        .toString();
  }
}

class WifiSetupInitializedBuilder
    implements Builder<WifiSetupInitialized, WifiSetupInitializedBuilder> {
  _$WifiSetupInitialized _$v;

  String _ssid;
  String get ssid => _$this._ssid;
  set ssid(String ssid) => _$this._ssid = ssid;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  WifiSetupInitializedBuilder();

  WifiSetupInitializedBuilder get _$this {
    if (_$v != null) {
      _ssid = _$v.ssid;
      _key = _$v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WifiSetupInitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WifiSetupInitialized;
  }

  @override
  void update(void Function(WifiSetupInitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WifiSetupInitialized build() {
    final _$result = _$v ?? new _$WifiSetupInitialized._(ssid: ssid, key: key);
    replace(_$result);
    return _$result;
  }
}

class _$WifiSetupSuccess extends WifiSetupSuccess {
  factory _$WifiSetupSuccess(
          [void Function(WifiSetupSuccessBuilder) updates]) =>
      (new WifiSetupSuccessBuilder()..update(updates)).build();

  _$WifiSetupSuccess._() : super._();

  @override
  WifiSetupSuccess rebuild(void Function(WifiSetupSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WifiSetupSuccessBuilder toBuilder() =>
      new WifiSetupSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WifiSetupSuccess;
  }

  @override
  int get hashCode {
    return 430991746;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('WifiSetupSuccess').toString();
  }
}

class WifiSetupSuccessBuilder
    implements Builder<WifiSetupSuccess, WifiSetupSuccessBuilder> {
  _$WifiSetupSuccess _$v;

  WifiSetupSuccessBuilder();

  @override
  void replace(WifiSetupSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WifiSetupSuccess;
  }

  @override
  void update(void Function(WifiSetupSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WifiSetupSuccess build() {
    final _$result = _$v ?? new _$WifiSetupSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$WifiSetupFailed extends WifiSetupFailed {
  @override
  final String message;

  factory _$WifiSetupFailed([void Function(WifiSetupFailedBuilder) updates]) =>
      (new WifiSetupFailedBuilder()..update(updates)).build();

  _$WifiSetupFailed._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('WifiSetupFailed', 'message');
    }
  }

  @override
  WifiSetupFailed rebuild(void Function(WifiSetupFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WifiSetupFailedBuilder toBuilder() =>
      new WifiSetupFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WifiSetupFailed && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WifiSetupFailed')
          ..add('message', message))
        .toString();
  }
}

class WifiSetupFailedBuilder
    implements Builder<WifiSetupFailed, WifiSetupFailedBuilder> {
  _$WifiSetupFailed _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  WifiSetupFailedBuilder();

  WifiSetupFailedBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WifiSetupFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WifiSetupFailed;
  }

  @override
  void update(void Function(WifiSetupFailedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WifiSetupFailed build() {
    final _$result = _$v ?? new _$WifiSetupFailed._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
