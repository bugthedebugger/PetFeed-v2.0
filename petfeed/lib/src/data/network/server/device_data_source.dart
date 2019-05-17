import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/models/device_access_token/device_access_token.dart';
import 'package:petfeed/src/data/network/api_routes.dart';
import 'package:petfeed/src/data/network/server/check_connection.dart';

class DeviceDataSource {
  final http.Client client;

  DeviceDataSource(this.client);

  Future<bool> getStatus({
    @required String token,
    @required String deviceID,
  }) async {
    bool status = await CheckConnection.status();

    if (status) {
      final response = await client.post(
        ServerApiRoutes.STATUS,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'deviceId': '$deviceID',
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        return false;
      }
    } else {
      throw NoInternetException();
    }
  }

  Future<DeviceAccessToken> registerDevice({
    @required String token,
    @required String deviceID,
    @required String password,
  }) async {
    final status = await CheckConnection.status();

    if (status) {
      final response = await client.post(
        ServerApiRoutes.DEVICE_LOGIN,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'deviceId': '$deviceID',
          'password': '$password',
        }),
      );

      if (response.statusCode == 200) {
        return DeviceAccessToken.fromJson(response.body);
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw DeviceRegistrationException(response.body);
      }
    } else {
      throw NoInternetException();
    }
  }
}
