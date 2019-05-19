// GENERATED CODE - DO NOT MODIFY BY HAND

part of local_status;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocalStatus> _$localStatusSerializer = new _$LocalStatusSerializer();

class _$LocalStatusSerializer implements StructuredSerializer<LocalStatus> {
  @override
  final Iterable<Type> types = const [LocalStatus, _$LocalStatus];
  @override
  final String wireName = 'LocalStatus';

  @override
  Iterable serialize(Serializers serializers, LocalStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'connection',
      serializers.serialize(object.connection,
          specifiedType: const FullType(String)),
    ];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.remainig != null) {
      result
        ..add('remainig')
        ..add(serializers.serialize(object.remainig,
            specifiedType: const FullType(double)));
    }

    return result;
  }

  @override
  LocalStatus deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocalStatusBuilder();

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'connection':
          result.connection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'remainig':
          result.remainig = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$LocalStatus extends LocalStatus {
  @override
  final String message;
  @override
  final String status;
  @override
  final String connection;
  @override
  final double remainig;

  factory _$LocalStatus([void Function(LocalStatusBuilder) updates]) =>
      (new LocalStatusBuilder()..update(updates)).build();

  _$LocalStatus._({this.message, this.status, this.connection, this.remainig})
      : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('LocalStatus', 'status');
    }
    if (connection == null) {
      throw new BuiltValueNullFieldError('LocalStatus', 'connection');
    }
  }

  @override
  LocalStatus rebuild(void Function(LocalStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocalStatusBuilder toBuilder() => new LocalStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalStatus &&
        message == other.message &&
        status == other.status &&
        connection == other.connection &&
        remainig == other.remainig;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), status.hashCode),
            connection.hashCode),
        remainig.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LocalStatus')
          ..add('message', message)
          ..add('status', status)
          ..add('connection', connection)
          ..add('remainig', remainig))
        .toString();
  }
}

class LocalStatusBuilder implements Builder<LocalStatus, LocalStatusBuilder> {
  _$LocalStatus _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _connection;
  String get connection => _$this._connection;
  set connection(String connection) => _$this._connection = connection;

  double _remainig;
  double get remainig => _$this._remainig;
  set remainig(double remainig) => _$this._remainig = remainig;

  LocalStatusBuilder();

  LocalStatusBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _status = _$v.status;
      _connection = _$v.connection;
      _remainig = _$v.remainig;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocalStatus other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LocalStatus;
  }

  @override
  void update(void Function(LocalStatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocalStatus build() {
    final _$result = _$v ??
        new _$LocalStatus._(
            message: message,
            status: status,
            connection: connection,
            remainig: remainig);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
