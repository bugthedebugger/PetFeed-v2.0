import 'package:kiwi/kiwi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:petfeed/src/bloc/register_bloc/register_bloc.dart';
import 'package:petfeed/src/data/network/server/user_data_source.dart';
import 'package:petfeed/src/data/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:petfeed/src/data/network/pi_scanner.dart';

Future initKiwi() async {
  Container().registerInstance(http.Client());
  Container().registerFactory((c) => PiScanner(c.resolve()));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Container().registerFactory((c) => preferences);
  Container().registerFactory((c) => UserDataSource(c.resolve()));
  Container().registerFactory((c) => UserRepository(c.resolve()));
  Container().registerFactory((c) => RegisterBloc(c.resolve(), c.resolve<SharedPreferences>()));
}