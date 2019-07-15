// GENERATED CODE - DO NOT MODIFY BY HAND

part of pet;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pet> _$petSerializer = new _$PetSerializer();

class _$PetSerializer implements StructuredSerializer<Pet> {
  @override
  final Iterable<Type> types = const [Pet, _$Pet];
  @override
  final String wireName = 'Pet';

  @override
  Iterable serialize(Serializers serializers, Pet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'pet_name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'pet_type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('pet_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.age != null) {
      result
        ..add('pet_age')
        ..add(serializers.serialize(object.age,
            specifiedType: const FullType(double)));
    }
    if (object.weight != null) {
      result
        ..add('pet_weight')
        ..add(serializers.serialize(object.weight,
            specifiedType: const FullType(double)));
    }

    return result;
  }

  @override
  Pet deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pet_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pet_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pet_age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'pet_weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'pet_type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Pet extends Pet {
  @override
  final String status;
  @override
  final String message;
  @override
  final int id;
  @override
  final String name;
  @override
  final double age;
  @override
  final double weight;
  @override
  final String type;

  factory _$Pet([void Function(PetBuilder) updates]) =>
      (new PetBuilder()..update(updates)).build();

  _$Pet._(
      {this.status,
      this.message,
      this.id,
      this.name,
      this.age,
      this.weight,
      this.type})
      : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('Pet', 'status');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('Pet', 'message');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Pet', 'name');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Pet', 'type');
    }
  }

  @override
  Pet rebuild(void Function(PetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetBuilder toBuilder() => new PetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pet &&
        status == other.status &&
        message == other.message &&
        id == other.id &&
        name == other.name &&
        age == other.age &&
        weight == other.weight &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, status.hashCode), message.hashCode),
                        id.hashCode),
                    name.hashCode),
                age.hashCode),
            weight.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pet')
          ..add('status', status)
          ..add('message', message)
          ..add('id', id)
          ..add('name', name)
          ..add('age', age)
          ..add('weight', weight)
          ..add('type', type))
        .toString();
  }
}

class PetBuilder implements Builder<Pet, PetBuilder> {
  _$Pet _$v;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  double _age;
  double get age => _$this._age;
  set age(double age) => _$this._age = age;

  double _weight;
  double get weight => _$this._weight;
  set weight(double weight) => _$this._weight = weight;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  PetBuilder();

  PetBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _message = _$v.message;
      _id = _$v.id;
      _name = _$v.name;
      _age = _$v.age;
      _weight = _$v.weight;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pet;
  }

  @override
  void update(void Function(PetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pet build() {
    final _$result = _$v ??
        new _$Pet._(
            status: status,
            message: message,
            id: id,
            name: name,
            age: age,
            weight: weight,
            type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
