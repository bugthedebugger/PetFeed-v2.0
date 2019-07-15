import 'dart:convert';

import 'package:meta/meta.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/models/user/user.dart';
import 'package:petfeed/src/data/network/api_routes.dart';

import 'check_connection.dart';

class UserDataSource {
  final http.Client client;

  UserDataSource(this.client);

  Future<User> registerUser({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    bool status = await CheckConnection.status();
    if (status) {
      final response = await client.post(
        ServerApiRoutes.REGISTER,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.body);
      } else {
        throw UserRegistrationException(response.body);
      }
    } else {
      throw NoInternetException();
    }
  }

  Future<User> reSendVerificationEmail(
      {@required String email, @required String password}) async {
    bool status = await CheckConnection.status();
    if (status) {
      final response = await client.post(
        ServerApiRoutes.RESEND_VERIFICATION,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.body);
      } else {
        throw UserRegistrationException(response.body);
      }
    } else {
      throw NoInternetException();
    }
  }

  Future<User> loginUser({
    @required String email,
    @required String password,
  }) async {
    bool status = await CheckConnection.status();

    if (status) {
      final response = await client.post(
        ServerApiRoutes.LOGIN,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200)
        return User.fromJson(response.body);
      else if (response.statusCode == 412)
        throw EmailVerificationException();
      else if (response.statusCode == 401)
        throw UnauthenticatedException();
      else
        throw UserLoginException(response.body);
    } else {
      throw NoInternetException();
    }
  }
}
