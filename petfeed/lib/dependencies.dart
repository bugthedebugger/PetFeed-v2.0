import 'package:kiwi/kiwi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future initKiwi() async {
  Container().registerInstance(http.Client);
}
