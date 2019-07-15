// GENERATED CODE - DO NOT MODIFY BY HAND

part of schedules;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Schedules> _$schedulesSerializer = new _$SchedulesSerializer();

class _$SchedulesSerializer implements StructuredSerializer<Schedules> {
  @override
  final Iterable<Type> types = const [Schedules, _$Schedules];
  @override
  final String wireName = 'Schedules';

  @override
  Iterable serialize(Serializers serializers, Schedules object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'schedules',
      serializers.serialize(object.schedules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Schedule)])),
      'petId',
      serializers.serialize(object.petId, specifiedType: const FullType(int)),
      'accessToken',
      serializers.serialize(object.accessToken,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Schedules deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SchedulesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'schedules':
          result.schedules.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Schedule)])) as BuiltList);
          break;
        case 'petId':
          result.petId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Schedules extends Schedules {
  @override
  final BuiltList<Schedule> schedules;
  @override
  final int petId;
  @override
  final String accessToken;

  factory _$Schedules([void Function(SchedulesBuilder) updates]) =>
      (new SchedulesBuilder()..update(updates)).build();

  _$Schedules._({this.schedules, this.petId, this.accessToken}) : super._() {
    if (schedules == null) {
      throw new BuiltValueNullFieldError('Schedules', 'schedules');
    }
    if (petId == null) {
      throw new BuiltValueNullFieldError('Schedules', 'petId');
    }
    if (accessToken == null) {
      throw new BuiltValueNullFieldError('Schedules', 'accessToken');
    }
  }

  @override
  Schedules rebuild(void Function(SchedulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchedulesBuilder toBuilder() => new SchedulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedules &&
        schedules == other.schedules &&
        petId == other.petId &&
        accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, schedules.hashCode), petId.hashCode), accessToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Schedules')
          ..add('schedules', schedules)
          ..add('petId', petId)
          ..add('accessToken', accessToken))
        .toString();
  }
}

class SchedulesBuilder implements Builder<Schedules, SchedulesBuilder> {
  _$Schedules _$v;

  ListBuilder<Schedule> _schedules;
  ListBuilder<Schedule> get schedules =>
      _$this._schedules ??= new ListBuilder<Schedule>();
  set schedules(ListBuilder<Schedule> schedules) =>
      _$this._schedules = schedules;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  String _accessToken;
  String get accessToken => _$this._accessToken;
  set accessToken(String accessToken) => _$this._accessToken = accessToken;

  SchedulesBuilder();

  SchedulesBuilder get _$this {
    if (_$v != null) {
      _schedules = _$v.schedules?.toBuilder();
      _petId = _$v.petId;
      _accessToken = _$v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Schedules other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Schedules;
  }

  @override
  void update(void Function(SchedulesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Schedules build() {
    _$Schedules _$result;
    try {
      _$result = _$v ??
          new _$Schedules._(
              schedules: schedules.build(),
              petId: petId,
              accessToken: accessToken);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'schedules';
        schedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Schedules', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
