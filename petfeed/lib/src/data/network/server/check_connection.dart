import 'package:http/http.dart' as http;
import 'package:petfeed/src/data/network/api_routes.dart';

class CheckConnection {
  static Future<bool> status() async {
    bool connected = false;
    http.Client client = http.Client();
    try {
      http.Response response = await client.get(ServerApiRoutes.SERVER_URL);
      if (response.statusCode == 200)
        connected = true;
      else
        connected = false;
    } catch (_) {
      connected = false;
    }

    return connected;
  }
}
