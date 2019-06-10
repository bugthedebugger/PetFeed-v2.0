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

class _$GetSchedules extends GetSchedules {
  factory _$GetSchedules([void Function(GetSchedulesBuilder) updates]) =>
      (new GetSchedulesBuilder()..update(updates)).build();

  _$GetSchedules._() : super._();

  @override
  GetSchedules rebuild(void Function(GetSchedulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSchedulesBuilder toBuilder() => new GetSchedulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSchedules;
  }

  @override
  int get hashCode {
    return 665358489;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetSchedules').toString();
  }
}

class GetSchedulesBuilder
    implements Builder<GetSchedules, GetSchedulesBuilder> {
  _$GetSchedules _$v;

  GetSchedulesBuilder();

  @override
  void replace(GetSchedules other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetSchedules;
  }

  @override
  void update(void Function(GetSchedulesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetSchedules build() {
    final _$result = _$v ?? new _$GetSchedules._();
    replace(_$result);
    return _$result;
  }
}

class _$GetSchedulesSuccess extends GetSchedulesSuccess {
  factory _$GetSchedulesSuccess(
          [void Function(GetSchedulesSuccessBuilder) updates]) =>
      (new GetSchedulesSuccessBuilder()..update(updates)).build();

  _$GetSchedulesSuccess._() : super._();

  @override
  GetSchedulesSuccess rebuild(
          void Function(GetSchedulesSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSchedulesSuccessBuilder toBuilder() =>
      new GetSchedulesSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSchedulesSuccess;
  }

  @override
  int get hashCode {
    return 708007985;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetSchedulesSuccess').toString();
  }
}

class GetSchedulesSuccessBuilder
    implements Builder<GetSchedulesSuccess, GetSchedulesSuccessBuilder> {
  _$GetSchedulesSuccess _$v;

  GetSchedulesSuccessBuilder();

  @override
  void replace(GetSchedulesSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetSchedulesSuccess;
  }

  @override
  void update(void Function(GetSchedulesSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetSchedulesSuccess build() {
    final _$result = _$v ?? new _$GetSchedulesSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$DeleteAllSchedules extends DeleteAllSchedules {
  factory _$DeleteAllSchedules(
          [void Function(DeleteAllSchedulesBuilder) updates]) =>
      (new DeleteAllSchedulesBuilder()..update(updates)).build();

  _$DeleteAllSchedules._() : super._();

  @override
  DeleteAllSchedules rebuild(
          void Function(DeleteAllSchedulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteAllSchedulesBuilder toBuilder() =>
      new DeleteAllSchedulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteAllSchedules;
  }

  @override
  int get hashCode {
    return 577395081;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('DeleteAllSchedules').toString();
  }
}

class DeleteAllSchedulesBuilder
    implements Builder<DeleteAllSchedules, DeleteAllSchedulesBuilder> {
  _$DeleteAllSchedules _$v;

  DeleteAllSchedulesBuilder();

  @override
  void replace(DeleteAllSchedules other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteAllSchedules;
  }

  @override
  void update(void Function(DeleteAllSchedulesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteAllSchedules build() {
    final _$result = _$v ?? new _$DeleteAllSchedules._();
    replace(_$result);
    return _$result;
  }
}

class _$ApplyRecommended extends ApplyRecommended {
  @override
  final Schedules schedules;

  factory _$ApplyRecommended(
          [void Function(ApplyRecommendedBuilder) updates]) =>
      (new ApplyRecommendedBuilder()..update(updates)).build();

  _$ApplyRecommended._({this.schedules}) : super._() {
    if (schedules == null) {
      throw new BuiltValueNullFieldError('ApplyRecommended', 'schedules');
    }
  }

  @override
  ApplyRecommended rebuild(void Function(ApplyRecommendedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApplyRecommendedBuilder toBuilder() =>
      new ApplyRecommendedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApplyRecommended && schedules == other.schedules;
  }

  @override
  int get hashCode {
    return $jf($jc(0, schedules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApplyRecommended')
          ..add('schedules', schedules))
        .toString();
  }
}

class ApplyRecommendedBuilder
    implements Builder<ApplyRecommended, ApplyRecommendedBuilder> {
  _$ApplyRecommended _$v;

  SchedulesBuilder _schedules;
  SchedulesBuilder get schedules =>
      _$this._schedules ??= new SchedulesBuilder();
  set schedules(SchedulesBuilder schedules) => _$this._schedules = schedules;

  ApplyRecommendedBuilder();

  ApplyRecommendedBuilder get _$this {
    if (_$v != null) {
      _schedules = _$v.schedules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApplyRecommended other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApplyRecommended;
  }

  @override
  void update(void Function(ApplyRecommendedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApplyRecommended build() {
    _$ApplyRecommended _$result;
    try {
      _$result = _$v ?? new _$ApplyRecommended._(schedules: schedules.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'schedules';
        schedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ApplyRecommended', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ApplyRecommendedSuccess extends ApplyRecommendedSuccess {
  factory _$ApplyRecommendedSuccess(
          [void Function(ApplyRecommendedSuccessBuilder) updates]) =>
      (new ApplyRecommendedSuccessBuilder()..update(updates)).build();

  _$ApplyRecommendedSuccess._() : super._();

  @override
  ApplyRecommendedSuccess rebuild(
          void Function(ApplyRecommendedSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApplyRecommendedSuccessBuilder toBuilder() =>
      new ApplyRecommendedSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApplyRecommendedSuccess;
  }

  @override
  int get hashCode {
    return 670139270;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ApplyRecommendedSuccess').toString();
  }
}

class ApplyRecommendedSuccessBuilder
    implements
        Builder<ApplyRecommendedSuccess, ApplyRecommendedSuccessBuilder> {
  _$ApplyRecommendedSuccess _$v;

  ApplyRecommendedSuccessBuilder();

  @override
  void replace(ApplyRecommendedSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApplyRecommendedSuccess;
  }

  @override
  void update(void Function(ApplyRecommendedSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApplyRecommendedSuccess build() {
    final _$result = _$v ?? new _$ApplyRecommendedSuccess._();
    replace(_$result);
    return _$result;
  }
}

class _$ApplyRecommendedError extends ApplyRecommendedError {
  @override
  final String message;

  factory _$ApplyRecommendedError(
          [void Function(ApplyRecommendedErrorBuilder) updates]) =>
      (new ApplyRecommendedErrorBuilder()..update(updates)).build();

  _$ApplyRecommendedError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('ApplyRecommendedError', 'message');
    }
  }

  @override
  ApplyRecommendedError rebuild(
          void Function(ApplyRecommendedErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApplyRecommendedErrorBuilder toBuilder() =>
      new ApplyRecommendedErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApplyRecommendedError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApplyRecommendedError')
          ..add('message', message))
        .toString();
  }
}

class ApplyRecommendedErrorBuilder
    implements Builder<ApplyRecommendedError, ApplyRecommendedErrorBuilder> {
  _$ApplyRecommendedError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ApplyRecommendedErrorBuilder();

  ApplyRecommendedErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApplyRecommendedError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApplyRecommendedError;
  }

  @override
  void update(void Function(ApplyRecommendedErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApplyRecommendedError build() {
    final _$result = _$v ?? new _$ApplyRecommendedError._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
