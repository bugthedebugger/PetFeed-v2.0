import 'package:meta/meta.dart';
import 'package:petfeed/src/data/models/device_access_token/device_access_token.dart';
import 'package:petfeed/src/data/network/server/device_data_source.dart';

class DeviceRepository {
  final DeviceDataSource dataSource;

  DeviceRepository(this.dataSource);

  Future<bool> getStatus(
      {@required String token, @required String deviceID}) async {
    return await dataSource.getStatus(token: token, deviceID: deviceID);
  }

  Future<DeviceAccessToken> registerDevice({
    @required String token,
    @required String deviceID,
    @required String password,
  }) async {
    return await dataSource.registerDevice(
      token: token,
      deviceID: deviceID,
      password: password,
    );
  }
}
