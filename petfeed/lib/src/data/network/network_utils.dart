import 'package:get_ip/get_ip.dart';
import 'dart:async';

Future<List<String>> getIpList() async {
  List<String> ipList = List<String>();

  String baseIp = await GetIp.ipAddress;
  baseIp = 'http://' + baseIp.substring(0, baseIp.lastIndexOf('.') + 1);

  for (int i = 0; i < 255; i++) {
    ipList.add(baseIp + '$i:8848');
  }

  return ipList;
}
