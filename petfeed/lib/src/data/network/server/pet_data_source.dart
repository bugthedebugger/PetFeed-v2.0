import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/exceptions/no_internet_exception.dart';
import 'package:petfeed/src/data/models/pet/pet.dart';
import 'package:petfeed/src/data/network/api_routes.dart';
import 'package:petfeed/src/data/network/server/check_connection.dart';

class PetDataSource {
  final http.Client client;

  PetDataSource(this.client);

  Future<Pet> registerPet({
    @required String token,
    @required String name,
    @required String type,
    double age,
    double weight,
  }) async {
    final status = await CheckConnection.status();

    if (status) {
      final response = await client.post(
        ServerApiRoutes.SAVE_PET,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'name': name,
          'type': type,
          'age': age,
          'weight': weight,
        }),
      );

      if (response.statusCode == 200) {
        return Pet.fromJson(response.body);
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw PetException(response.body);
      }
    } else {
      throw NoInternetException();
    }
  }
}
