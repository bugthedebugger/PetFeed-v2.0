library pet;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:petfeed/src/data/models/serializer/serializer.dart';

part 'pet.g.dart';

abstract class Pet implements Built<Pet, PetBuilder> {
  String get status;
  String get message;
  @nullable
  @BuiltValueField(wireName: 'pet_id')
  int get id;
  @BuiltValueField(wireName: 'pet_name')
  String get name;
  @nullable
  @BuiltValueField(wireName: 'pet_age')
  double get age;
  @nullable
  @BuiltValueField(wireName: 'pet_weight')
  double get weight;
  @BuiltValueField(wireName: 'pet_type')
  String get type;

  Pet._();

  factory Pet([updates(PetBuilder b)]) = _$Pet;

  String toJson() {
    return json.encode(serializers.serializeWith(Pet.serializer, this));
  }

  static Pet fromJson(String jsonString) {
    return serializers.deserializeWith(Pet.serializer, json.decode(jsonString));
  }

  static Serializer<Pet> get serializer => _$petSerializer;
}
