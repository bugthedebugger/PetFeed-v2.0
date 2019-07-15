// GENERATED CODE - DO NOT MODIFY BY HAND

part of count_down_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TimerStart extends TimerStart {
  @override
  final DateTime date;

  factory _$TimerStart([void Function(TimerStartBuilder) updates]) =>
      (new TimerStartBuilder()..update(updates)).build();

  _$TimerStart._({this.date}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('TimerStart', 'date');
    }
  }

  @override
  TimerStart rebuild(void Function(TimerStartBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimerStartBuilder toBuilder() => new TimerStartBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimerStart && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TimerStart')..add('date', date))
        .toString();
  }
}

class TimerStartBuilder implements Builder<TimerStart, TimerStartBuilder> {
  _$TimerStart _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  TimerStartBuilder();

  TimerStartBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimerStart other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TimerStart;
  }

  @override
  void update(void Function(TimerStartBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TimerStart build() {
    final _$result = _$v ?? new _$TimerStart._(date: date);
    replace(_$result);
    return _$result;
  }
}

class _$TimerStop extends TimerStop {
  factory _$TimerStop([void Function(TimerStopBuilder) updates]) =>
      (new TimerStopBuilder()..update(updates)).build();

  _$TimerStop._() : super._();

  @override
  TimerStop rebuild(void Function(TimerStopBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimerStopBuilder toBuilder() => new TimerStopBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimerStop;
  }

  @override
  int get hashCode {
    return 392080231;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('TimerStop').toString();
  }
}

class TimerStopBuilder implements Builder<TimerStop, TimerStopBuilder> {
  _$TimerStop _$v;

  TimerStopBuilder();

  @override
  void replace(TimerStop other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TimerStop;
  }

  @override
  void update(void Function(TimerStopBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TimerStop build() {
    final _$result = _$v ?? new _$TimerStop._();
    replace(_$result);
    return _$result;
  }
}

class _$TimerReached extends TimerReached {
  factory _$TimerReached([void Function(TimerReachedBuilder) updates]) =>
      (new TimerReachedBuilder()..update(updates)).build();

  _$TimerReached._() : super._();

  @override
  TimerReached rebuild(void Function(TimerReachedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimerReachedBuilder toBuilder() => new TimerReachedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimerReached;
  }

  @override
  int get hashCode {
    return 836176276;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('TimerReached').toString();
  }
}

class TimerReachedBuilder
    implements Builder<TimerReached, TimerReachedBuilder> {
  _$TimerReached _$v;

  TimerReachedBuilder();

  @override
  void replace(TimerReached other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TimerReached;
  }

  @override
  void update(void Function(TimerReachedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TimerReached build() {
    final _$result = _$v ?? new _$TimerReached._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
