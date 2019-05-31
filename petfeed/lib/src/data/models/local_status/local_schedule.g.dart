// GENERATED CODE - DO NOT MODIFY BY HAND

part of local_schedule;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocalSchedule> _$localScheduleSerializer =
    new _$LocalScheduleSerializer();

class _$LocalScheduleSerializer implements StructuredSerializer<LocalSchedule> {
  @override
  final Iterable<Type> types = const [LocalSchedule, _$LocalSchedule];
  @override
  final String wireName = 'LocalSchedule';

  @override
  Iterable serialize(Serializers serializers, LocalSchedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'day',
      serializers.serialize(object.day, specifiedType: const FullType(String)),
      'feedTime',
      serializers.serialize(object.feedTime,
          specifiedType: const FullType(String)),
      'groupId',
      serializers.serialize(object.groupID,
          specifiedType: const FullType(String)),
      'petId',
      serializers.serialize(object.petID, specifiedType: const FullType(int)),
      'uId',
      serializers.serialize(object.uID, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LocalSchedule deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocalScheduleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'feedTime':
          result.feedTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupId':
          result.groupID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'petId':
          result.petID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'uId':
          result.uID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LocalSchedule extends LocalSchedule {
  @override
  final double amount;
  @override
  final String day;
  @override
  final String feedTime;
  @override
  final String groupID;
  @override
  final int petID;
  @override
  final String uID;

  factory _$LocalSchedule([void Function(LocalScheduleBuilder) updates]) =>
      (new LocalScheduleBuilder()..update(updates)).build();

  _$LocalSchedule._(
      {this.amount,
      this.day,
      this.feedTime,
      this.groupID,
      this.petID,
      this.uID})
      : super._() {
    if (amount == null) {
      throw new BuiltValueNullFieldError('LocalSchedule', 'amount');
    }
    if (day == null) {
      throw new BuiltValueNullFieldError('LocalSchedule', 'day');
    }
    if (feedTime == null) {
      throw new BuiltValueNullFieldError('LocalSchedule', 'feedTime');
    }
    if (groupID == null) {
      throw new BuiltValueNullFieldError('LocalSchedule', 'groupID');
    }
    if (petID == null) {
      throw new BuiltValueNullFieldError('LocalSchedule', 'petID');
    }
    if (uID == null) {
      throw new BuiltValueNullFieldError('LocalSchedule', 'uID');
    }
  }

  @override
  LocalSchedule rebuild(void Function(LocalScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocalScheduleBuilder toBuilder() => new LocalScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalSchedule &&
        amount == other.amount &&
        day == other.day &&
        feedTime == other.feedTime &&
        groupID == other.groupID &&
        petID == other.petID &&
        uID == other.uID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, amount.hashCode), day.hashCode),
                    feedTime.hashCode),
                groupID.hashCode),
            petID.hashCode),
        uID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LocalSchedule')
          ..add('amount', amount)
          ..add('day', day)
          ..add('feedTime', feedTime)
          ..add('groupID', groupID)
          ..add('petID', petID)
          ..add('uID', uID))
        .toString();
  }
}

class LocalScheduleBuilder
    implements Builder<LocalSchedule, LocalScheduleBuilder> {
  _$LocalSchedule _$v;

  double _amount;
  double get amount => _$this._amount;
  set amount(double amount) => _$this._amount = amount;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  String _feedTime;
  String get feedTime => _$this._feedTime;
  set feedTime(String feedTime) => _$this._feedTime = feedTime;

  String _groupID;
  String get groupID => _$this._groupID;
  set groupID(String groupID) => _$this._groupID = groupID;

  int _petID;
  int get petID => _$this._petID;
  set petID(int petID) => _$this._petID = petID;

  String _uID;
  String get uID => _$this._uID;
  set uID(String uID) => _$this._uID = uID;

  LocalScheduleBuilder();

  LocalScheduleBuilder get _$this {
    if (_$v != null) {
      _amount = _$v.amount;
      _day = _$v.day;
      _feedTime = _$v.feedTime;
      _groupID = _$v.groupID;
      _petID = _$v.petID;
      _uID = _$v.uID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocalSchedule other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LocalSchedule;
  }

  @override
  void update(void Function(LocalScheduleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocalSchedule build() {
    final _$result = _$v ??
        new _$LocalSchedule._(
            amount: amount,
            day: day,
            feedTime: feedTime,
            groupID: groupID,
            petID: petID,
            uID: uID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
