import 'package:meta/meta.dart';
import 'package:petfeed/src/data/models/local_status/local_status.dart';
import 'package:petfeed/src/data/models/local_status/schedule_status.dart';
import 'package:petfeed/src/data/models/schedules/schedules.dart';
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
    final response = await piSource.setWifi(
      ssid: ssid,
      key: key,
    );

    return response;
  }

  Future<LocalStatus> treat({
    @required String deviceToken,
    @required double amount,
  }) async {
    final response = await piSource.treat(
      deviceToken: deviceToken,
      amount: amount,
    );

    return response;
  }

  Future<ScheduleStatus> addSchedule({@required Schedules schedules}) async {
    final response = await piSource.addSchedule(schedules: schedules);
    return response;
  }

  Future<LocalStatus> deviceStatus() async {
    final response = await piSource.deviceStatus();
    return response;
  }
}
