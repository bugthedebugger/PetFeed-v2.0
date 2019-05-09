import 'package:kiwi/kiwi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:petfeed/src/data/network/pi_scanner.dart';

Future initKiwi() async {
  Container().registerInstance(http.Client());
  Container().registerFactory((c) => PiScanner(c.resolve()));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Container().registerFactory((c) => preferences);
}
