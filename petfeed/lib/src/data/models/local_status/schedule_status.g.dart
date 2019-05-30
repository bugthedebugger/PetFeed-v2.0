// GENERATED CODE - DO NOT MODIFY BY HAND

part of schedule_status;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScheduleStatus> _$scheduleStatusSerializer =
    new _$ScheduleStatusSerializer();

class _$ScheduleStatusSerializer
    implements StructuredSerializer<ScheduleStatus> {
  @override
  final Iterable<Type> types = const [ScheduleStatus, _$ScheduleStatus];
  @override
  final String wireName = 'ScheduleStatus';

  @override
  Iterable serialize(Serializers serializers, ScheduleStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'connection',
      serializers.serialize(object.connection,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ScheduleStatus deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'connection':
          result.connection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleStatus extends ScheduleStatus {
  @override
  final String connection;
  @override
  final String message;
  @override
  final String status;

  factory _$ScheduleStatus([void Function(ScheduleStatusBuilder) updates]) =>
      (new ScheduleStatusBuilder()..update(updates)).build();

  _$ScheduleStatus._({this.connection, this.message, this.status}) : super._() {
    if (connection == null) {
      throw new BuiltValueNullFieldError('ScheduleStatus', 'connection');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('ScheduleStatus', 'message');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('ScheduleStatus', 'status');
    }
  }

  @override
  ScheduleStatus rebuild(void Function(ScheduleStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleStatusBuilder toBuilder() =>
      new ScheduleStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleStatus &&
        connection == other.connection &&
        message == other.message &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, connection.hashCode), message.hashCode), status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScheduleStatus')
          ..add('connection', connection)
          ..add('message', message)
          ..add('status', status))
        .toString();
  }
}

class ScheduleStatusBuilder
    implements Builder<ScheduleStatus, ScheduleStatusBuilder> {
  _$ScheduleStatus _$v;

  String _connection;
  String get connection => _$this._connection;
  set connection(String connection) => _$this._connection = connection;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  ScheduleStatusBuilder();

  ScheduleStatusBuilder get _$this {
    if (_$v != null) {
      _connection = _$v.connection;
      _message = _$v.message;
      _status = _$v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleStatus other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScheduleStatus;
  }

  @override
  void update(void Function(ScheduleStatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScheduleStatus build() {
    final _$result = _$v ??
        new _$ScheduleStatus._(
            connection: connection, message: message, status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
