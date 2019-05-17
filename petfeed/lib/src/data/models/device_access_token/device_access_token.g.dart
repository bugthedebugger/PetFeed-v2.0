// GENERATED CODE - DO NOT MODIFY BY HAND

part of device_access_token;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeviceAccessToken> _$deviceAccessTokenSerializer =
    new _$DeviceAccessTokenSerializer();

class _$DeviceAccessTokenSerializer
    implements StructuredSerializer<DeviceAccessToken> {
  @override
  final Iterable<Type> types = const [DeviceAccessToken, _$DeviceAccessToken];
  @override
  final String wireName = 'DeviceAccessToken';

  @override
  Iterable serialize(Serializers serializers, DeviceAccessToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'deviceId',
      serializers.serialize(object.deviceId,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DeviceAccessToken deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceAccessTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deviceId':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DeviceAccessToken extends DeviceAccessToken {
  @override
  final String message;
  @override
  final String deviceId;
  @override
  final String token;

  factory _$DeviceAccessToken(
          [void Function(DeviceAccessTokenBuilder) updates]) =>
      (new DeviceAccessTokenBuilder()..update(updates)).build();

  _$DeviceAccessToken._({this.message, this.deviceId, this.token}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('DeviceAccessToken', 'message');
    }
    if (deviceId == null) {
      throw new BuiltValueNullFieldError('DeviceAccessToken', 'deviceId');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('DeviceAccessToken', 'token');
    }
  }

  @override
  DeviceAccessToken rebuild(void Function(DeviceAccessTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceAccessTokenBuilder toBuilder() =>
      new DeviceAccessTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceAccessToken &&
        message == other.message &&
        deviceId == other.deviceId &&
        token == other.token;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, message.hashCode), deviceId.hashCode), token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceAccessToken')
          ..add('message', message)
          ..add('deviceId', deviceId)
          ..add('token', token))
        .toString();
  }
}

class DeviceAccessTokenBuilder
    implements Builder<DeviceAccessToken, DeviceAccessTokenBuilder> {
  _$DeviceAccessToken _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _deviceId;
  String get deviceId => _$this._deviceId;
  set deviceId(String deviceId) => _$this._deviceId = deviceId;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  DeviceAccessTokenBuilder();

  DeviceAccessTokenBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _deviceId = _$v.deviceId;
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceAccessToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeviceAccessToken;
  }

  @override
  void update(void Function(DeviceAccessTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceAccessToken build() {
    final _$result = _$v ??
        new _$DeviceAccessToken._(
            message: message, deviceId: deviceId, token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
