import 'package:meta/meta.dart';
import 'package:petfeed/src/data/models/local_status/local_status.dart';
import 'package:petfeed/src/data/network/local/pi_data_source.dart';

class PiRepository {
  final PiDataSource piSource;

  PiRepository(this.piSource);

  Future<bool> getStatus() async {
    final response = await piSource.ping();
    return response;
  }

  Future<LocalStatus> setWifi({
    @required String ssid,
    @required String key,
  }) async {
    print('here');

    final response = await piSource.setWifi(
      ssid: ssid,
      key: key,
    );

    return response;
  }
}
