import 'dart:async';
import 'package:meta/meta.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/models/user/user.dart';
import 'package:petfeed/src/data/network/server/user_data_source.dart';

class UserRepository {
  final UserDataSource dataSource;

  UserRepository(this.dataSource);

  Future<User> registerUser({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    final response = await dataSource.registerUser(
        name: name, email: email, password: password);
    if (response != null)
      return response;
    else
      throw UserRegistrationException("Ooops! Something wen't horribly wrong!");
  }

  Future<User> reSendVerificationEmail({
    @required String email,
    @required String password,
  }) async {
    final response = await dataSource.reSendVerificationEmail(
        email: email, password: password);
    if (response != null)
      return response;
    else
      throw UserRegistrationException("Ooops! Something wen't horribly wrong!");
  }

  Future<User> loginUser({
    @required String email,
    @required String password,
  }) async {
    final response =
        await dataSource.loginUser(email: email, password: password);
    if (response != null)
      return response;
    else
      throw UserLoginException("Ooops! Something wen't horribly wrong!");
  }
}
