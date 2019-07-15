// GENERATED CODE - DO NOT MODIFY BY HAND

part of pet_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PetRegisterInitiated extends PetRegisterInitiated {
  @override
  final String token;
  @override
  final String name;
  @override
  final String type;
  @override
  final double weight;
  @override
  final double age;

  factory _$PetRegisterInitiated(
          [void Function(PetRegisterInitiatedBuilder) updates]) =>
      (new PetRegisterInitiatedBuilder()..update(updates)).build();

  _$PetRegisterInitiated._(
      {this.token, this.name, this.type, this.weight, this.age})
      : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('PetRegisterInitiated', 'token');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('PetRegisterInitiated', 'name');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('PetRegisterInitiated', 'type');
    }
  }

  @override
  PetRegisterInitiated rebuild(
          void Function(PetRegisterInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetRegisterInitiatedBuilder toBuilder() =>
      new PetRegisterInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetRegisterInitiated &&
        token == other.token &&
        name == other.name &&
        type == other.type &&
        weight == other.weight &&
        age == other.age;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, token.hashCode), name.hashCode), type.hashCode),
            weight.hashCode),
        age.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetRegisterInitiated')
          ..add('token', token)
          ..add('name', name)
          ..add('type', type)
          ..add('weight', weight)
          ..add('age', age))
        .toString();
  }
}

class PetRegisterInitiatedBuilder
    implements Builder<PetRegisterInitiated, PetRegisterInitiatedBuilder> {
  _$PetRegisterInitiated _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  double _weight;
  double get weight => _$this._weight;
  set weight(double weight) => _$this._weight = weight;

  double _age;
  double get age => _$this._age;
  set age(double age) => _$this._age = age;

  PetRegisterInitiatedBuilder();

  PetRegisterInitiatedBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _name = _$v.name;
      _type = _$v.type;
      _weight = _$v.weight;
      _age = _$v.age;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetRegisterInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetRegisterInitiated;
  }

  @override
  void update(void Function(PetRegisterInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetRegisterInitiated build() {
    final _$result = _$v ??
        new _$PetRegisterInitiated._(
            token: token, name: name, type: type, weight: weight, age: age);
    replace(_$result);
    return _$result;
  }
}

class _$PetRegisterSuccessful extends PetRegisterSuccessful {
  factory _$PetRegisterSuccessful(
          [void Function(PetRegisterSuccessfulBuilder) updates]) =>
      (new PetRegisterSuccessfulBuilder()..update(updates)).build();

  _$PetRegisterSuccessful._() : super._();

  @override
  PetRegisterSuccessful rebuild(
          void Function(PetRegisterSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetRegisterSuccessfulBuilder toBuilder() =>
      new PetRegisterSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetRegisterSuccessful;
  }

  @override
  int get hashCode {
    return 422323565;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('PetRegisterSuccessful').toString();
  }
}

class PetRegisterSuccessfulBuilder
    implements Builder<PetRegisterSuccessful, PetRegisterSuccessfulBuilder> {
  _$PetRegisterSuccessful _$v;

  PetRegisterSuccessfulBuilder();

  @override
  void replace(PetRegisterSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetRegisterSuccessful;
  }

  @override
  void update(void Function(PetRegisterSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetRegisterSuccessful build() {
    final _$result = _$v ?? new _$PetRegisterSuccessful._();
    replace(_$result);
    return _$result;
  }
}

class _$PetRegisterError extends PetRegisterError {
  @override
  final String message;

  factory _$PetRegisterError(
          [void Function(PetRegisterErrorBuilder) updates]) =>
      (new PetRegisterErrorBuilder()..update(updates)).build();

  _$PetRegisterError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('PetRegisterError', 'message');
    }
  }

  @override
  PetRegisterError rebuild(void Function(PetRegisterErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetRegisterErrorBuilder toBuilder() =>
      new PetRegisterErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetRegisterError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetRegisterError')
          ..add('message', message))
        .toString();
  }
}

class PetRegisterErrorBuilder
    implements Builder<PetRegisterError, PetRegisterErrorBuilder> {
  _$PetRegisterError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  PetRegisterErrorBuilder();

  PetRegisterErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetRegisterError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetRegisterError;
  }

  @override
  void update(void Function(PetRegisterErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetRegisterError build() {
    final _$result = _$v ?? new _$PetRegisterError._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
