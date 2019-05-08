import 'dart:async';
import 'dart:io';
import 'package:get_ip/get_ip.dart';
import 'package:http/http.dart' as http;

import 'network_utils.dart';

class PiScanner {
  final http.Client client;

  PiScanner(this.client);

  void findDevice() async {
    List<String> ipList = await getIpList();

    for (int i = 0; i < ipList.length; i++) {
      print(ipList[i]);
      try {
        http.Response response =
            await client.post(ipList[i]).timeout(Duration(milliseconds: 200));
        if (response.statusCode == 200) print(response.body);
      } on SocketException catch (e) {
        print(e);
      } on TimeoutException catch (e) {
        print(e);
      }
    }
  }
}
