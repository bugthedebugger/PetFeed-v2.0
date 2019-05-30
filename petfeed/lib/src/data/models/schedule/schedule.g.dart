// GENERATED CODE - DO NOT MODIFY BY HAND

part of schedule;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Schedule> _$scheduleSerializer = new _$ScheduleSerializer();

class _$ScheduleSerializer implements StructuredSerializer<Schedule> {
  @override
  final Iterable<Type> types = const [Schedule, _$Schedule];
  @override
  final String wireName = 'Schedule';

  @override
  Iterable serialize(Serializers serializers, Schedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'feedTimes',
      serializers.serialize(object.feedTimes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'repeat',
      serializers.serialize(object.repeat,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.groupID != null) {
      result
        ..add('groupID')
        ..add(serializers.serialize(object.groupID,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Schedule deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'feedTimes':
          result.feedTimes.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'repeat':
          result.repeat.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'groupID':
          result.groupID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Schedule extends Schedule {
  @override
  final BuiltList<String> feedTimes;
  @override
  final double amount;
  @override
  final BuiltList<String> repeat;
  @override
  final String groupID;

  factory _$Schedule([void Function(ScheduleBuilder) updates]) =>
      (new ScheduleBuilder()..update(updates)).build();

  _$Schedule._({this.feedTimes, this.amount, this.repeat, this.groupID})
      : super._() {
    if (feedTimes == null) {
      throw new BuiltValueNullFieldError('Schedule', 'feedTimes');
    }
    if (amount == null) {
      throw new BuiltValueNullFieldError('Schedule', 'amount');
    }
    if (repeat == null) {
      throw new BuiltValueNullFieldError('Schedule', 'repeat');
    }
  }

  @override
  Schedule rebuild(void Function(ScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleBuilder toBuilder() => new ScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedule &&
        feedTimes == other.feedTimes &&
        amount == other.amount &&
        repeat == other.repeat &&
        groupID == other.groupID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, feedTimes.hashCode), amount.hashCode), repeat.hashCode),
        groupID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Schedule')
          ..add('feedTimes', feedTimes)
          ..add('amount', amount)
          ..add('repeat', repeat)
          ..add('groupID', groupID))
        .toString();
  }
}

class ScheduleBuilder implements Builder<Schedule, ScheduleBuilder> {
  _$Schedule _$v;

  ListBuilder<String> _feedTimes;
  ListBuilder<String> get feedTimes =>
      _$this._feedTimes ??= new ListBuilder<String>();
  set feedTimes(ListBuilder<String> feedTimes) => _$this._feedTimes = feedTimes;

  double _amount;
  double get amount => _$this._amount;
  set amount(double amount) => _$this._amount = amount;

  ListBuilder<String> _repeat;
  ListBuilder<String> get repeat =>
      _$this._repeat ??= new ListBuilder<String>();
  set repeat(ListBuilder<String> repeat) => _$this._repeat = repeat;

  String _groupID;
  String get groupID => _$this._groupID;
  set groupID(String groupID) => _$this._groupID = groupID;

  ScheduleBuilder();

  ScheduleBuilder get _$this {
    if (_$v != null) {
      _feedTimes = _$v.feedTimes?.toBuilder();
      _amount = _$v.amount;
      _repeat = _$v.repeat?.toBuilder();
      _groupID = _$v.groupID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Schedule other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Schedule;
  }

  @override
  void update(void Function(ScheduleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Schedule build() {
    _$Schedule _$result;
    try {
      _$result = _$v ??
          new _$Schedule._(
              feedTimes: feedTimes.build(),
              amount: amount,
              repeat: repeat.build(),
              groupID: groupID);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'feedTimes';
        feedTimes.build();

        _$failedField = 'repeat';
        repeat.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Schedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
