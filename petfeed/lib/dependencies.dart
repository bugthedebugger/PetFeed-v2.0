import 'package:kiwi/kiwi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:petfeed/src/bloc/calibration_bloc/calibration_bloc.dart';
import 'package:petfeed/src/bloc/device_register_bloc/device_register_bloc.dart';
import 'package:petfeed/src/bloc/login_bloc/login_bloc.dart';
import 'package:petfeed/src/bloc/register_bloc/register_bloc.dart';
import 'package:petfeed/src/bloc/wifi_setup_bloc/wifi_setup_bloc_export.dart';
import 'package:petfeed/src/data/network/local/pi_data_source.dart';
import 'package:petfeed/src/data/network/local/pi_scanner.dart';
import 'package:petfeed/src/data/network/pusher/pusher.dart';
import 'package:petfeed/src/data/network/server/device_data_source.dart';
import 'package:petfeed/src/data/network/server/user_data_source.dart';
import 'package:petfeed/src/data/repository/device_repository.dart';
import 'package:petfeed/src/data/repository/pi_repository.dart';
import 'package:petfeed/src/data/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future initKiwi() async {
  Container().registerInstance(http.Client());
  Container().registerFactory((c) => PiScanner(c.resolve()));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Container().registerFactory((c) => preferences);
  Container().registerFactory((c) => UserDataSource(c.resolve()));
  Container().registerFactory((c) => UserRepository(c.resolve()));
  Container().registerFactory(
      (c) => RegisterBloc(c.resolve(), c.resolve<SharedPreferences>()));
  Container().registerFactory(
      (c) => LoginBloc(c.resolve(), c.resolve<SharedPreferences>()));
  Container().registerFactory((c) =>
      PiDataSource(c.resolve(), c.resolve<SharedPreferences>(), c.resolve()));
  Container().registerFactory((c) => PiRepository(c.resolve()));
  Container().registerFactory((c) => WifiSetupBloc(c.resolve()));
  Container().registerFactory((c) => DeviceDataSource(c.resolve()));
  Container().registerFactory((c) => DeviceRepository(c.resolve()));
  Container().registerFactory((c) => Pusher());
  Container().registerFactory(
      (c) => DeviceRegisterBloc(c.resolve(), c.resolve<SharedPreferences>(), c.resolve()));
  Container().registerFactory((c) => CalibrationBloc(c.resolve(), c.resolve(), c.resolve()));
}
