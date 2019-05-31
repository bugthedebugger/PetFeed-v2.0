// GENERATED CODE - DO NOT MODIFY BY HAND

part of schedules_bloc_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddSchedule extends AddSchedule {
  @override
  final Schedules schedules;

  factory _$AddSchedule([void Function(AddScheduleBuilder) updates]) =>
      (new AddScheduleBuilder()..update(updates)).build();

  _$AddSchedule._({this.schedules}) : super._() {
    if (schedules == null) {
      throw new BuiltValueNullFieldError('AddSchedule', 'schedules');
    }
  }

  @override
  AddSchedule rebuild(void Function(AddScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddScheduleBuilder toBuilder() => new AddScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddSchedule && schedules == other.schedules;
  }

  @override
  int get hashCode {
    return $jf($jc(0, schedules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddSchedule')
          ..add('schedules', schedules))
        .toString();
  }
}

class AddScheduleBuilder implements Builder<AddSchedule, AddScheduleBuilder> {
  _$AddSchedule _$v;

  SchedulesBuilder _schedules;
  SchedulesBuilder get schedules =>
      _$this._schedules ??= new SchedulesBuilder();
  set schedules(SchedulesBuilder schedules) => _$this._schedules = schedules;

  AddScheduleBuilder();

  AddScheduleBuilder get _$this {
    if (_$v != null) {
      _schedules = _$v.schedules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddSchedule other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddSchedule;
  }

  @override
  void update(void Function(AddScheduleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddSchedule build() {
    _$AddSchedule _$result;
    try {
      _$result = _$v ?? new _$AddSchedule._(schedules: schedules.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'schedules';
        schedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddSchedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ScheduleAddedSuccessfully extends ScheduleAddedSuccessfully {
  factory _$ScheduleAddedSuccessfully(
          [void Function(ScheduleAddedSuccessfullyBuilder) updates]) =>
      (new ScheduleAddedSuccessfullyBuilder()..update(updates)).build();

  _$ScheduleAddedSuccessfully._() : super._();

  @override
  ScheduleAddedSuccessfully rebuild(
          void Function(ScheduleAddedSuccessfullyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleAddedSuccessfullyBuilder toBuilder() =>
      new ScheduleAddedSuccessfullyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleAddedSuccessfully;
  }

  @override
  int get hashCode {
    return 897388680;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ScheduleAddedSuccessfully').toString();
  }
}

class ScheduleAddedSuccessfullyBuilder
    implements
        Builder<ScheduleAddedSuccessfully, ScheduleAddedSuccessfullyBuilder> {
  _$ScheduleAddedSuccessfully _$v;

  ScheduleAddedSuccessfullyBuilder();

  @override
  void replace(ScheduleAddedSuccessfully other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScheduleAddedSuccessfully;
  }

  @override
  void update(void Function(ScheduleAddedSuccessfullyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScheduleAddedSuccessfully build() {
    final _$result = _$v ?? new _$ScheduleAddedSuccessfully._();
    replace(_$result);
    return _$result;
  }
}

class _$ScheduleError extends ScheduleError {
  @override
  final String message;

  factory _$ScheduleError([void Function(ScheduleErrorBuilder) updates]) =>
      (new ScheduleErrorBuilder()..update(updates)).build();

  _$ScheduleError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('ScheduleError', 'message');
    }
  }

  @override
  ScheduleError rebuild(void Function(ScheduleErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleErrorBuilder toBuilder() => new ScheduleErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScheduleError')
          ..add('message', message))
        .toString();
  }
}

class ScheduleErrorBuilder
    implements Builder<ScheduleError, ScheduleErrorBuilder> {
  _$ScheduleError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ScheduleErrorBuilder();

  ScheduleErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScheduleError;
  }

  @override
  void update(void Function(ScheduleErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScheduleError build() {
    final _$result = _$v ?? new _$ScheduleError._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
