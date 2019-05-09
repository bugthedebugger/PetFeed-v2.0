import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'network_utils.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:connectivity/connectivity.dart';

class PiScanner {
  final http.Client client;

  PiScanner(this.client);

  Future<bool> findDevice() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    // ConnectivityResult.
    var connection = await Connectivity().getWifiIP();

    List<String> ipList = await getIpList();
    bool found = false;
    int timeOut = 500;
    SharedPreferences preferences =
        kiwi.Container().resolve<SharedPreferences>();

    for (int i = 0; i <= ipList.length ~/ 2; i++) {
      try {
        print(ipList[i]);
        http.Response response = await client
            .post(ipList[i])
            .timeout(Duration(milliseconds: timeOut));
        if (response.statusCode == 200) {
          preferences.setString('deviceIP', ipList[i]);
          print('found in first');
          found = true;
          print(response.body);
          break;
        }
      } on SocketException catch (e) {
        // print(e);
      } on TimeoutException catch (e) {
        // print(e);
      }
      try {
        print(ipList[ipList.length - i - 1]);
        http.Response response = await client
            .post(ipList[ipList.length - i - 1])
            .timeout(Duration(milliseconds: timeOut));
        if (response.statusCode == 200) {
          preferences.setString('deviceIP', ipList[i]);
          print('found in second');
          found = true;
          print(response.body);
          break;
        }
      } on SocketException catch (e) {
        // print(e);
      } on TimeoutException catch (e) {
        // print(e);
      }
    }

    return found;
  }
}
