import 'package:kiwi/kiwi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future initKiwi() async {
  Container().registerInstance(http.Client);
  // Container().registerSingleton((c) => ScreenUtil.instance);
}
