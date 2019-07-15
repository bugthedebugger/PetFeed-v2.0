import 'dart:async';
import 'package:meta/meta.dart';
import 'package:petfeed/src/data/models/pet/pet.dart';
import 'package:petfeed/src/data/network/server/pet_data_source.dart';

class PetRepository {
  final PetDataSource dataSource;

  PetRepository(this.dataSource);

  Future<Pet> registerPet({
    @required String token,
    @required String name,
    @required String type,
    double age,
    double weight,
  }) async {
    return await dataSource.registerPet(
      token: token,
      name: name,
      type: type,
      age: age,
      weight: weight,
    );
  }
}
