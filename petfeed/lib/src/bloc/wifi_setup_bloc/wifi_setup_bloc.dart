import 'dart:async';

import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/wifi_setup_bloc/wifi_setup_events.dart';
import 'package:petfeed/src/data/exceptions/device_not_found_exception.dart';
import 'package:petfeed/src/data/exceptions/wifi_setup_exception.dart';
import 'package:petfeed/src/data/repository/pi_repository.dart';

class WifiSetupBloc extends Bloc {
  final PiRepository repository;

  WifiSetupBloc(this.repository){
    init();
  }

  StreamController<WifiSetupEvents> _eventController =
      StreamController<WifiSetupEvents>.broadcast();
  Stream<WifiSetupEvents> get eventStream => _eventController.stream;
  Sink<WifiSetupEvents> get _eventSink => _eventController.sink;

  void init() {
    _eventController.stream.listen(_mapEventsToState);
  }

  void _mapEventsToState(WifiSetupEvents event) {
    if (event is WifiSetupInitialized) {
      _mapWifiSetupInitialized(event);
    }
  }

  void setWifi({@required String ssid, @required String key}) {
    dispatch(
      WifiSetupInitialized((b) => b
        ..ssid = ssid
        ..key = key),
    );
  }

  void _mapWifiSetupInitialized(WifiSetupInitialized event) async {
    try {
      final response = await repository.setWifi(
        ssid: event.ssid,
        key: event.key,
      );
      if (response == null)
        dispatch(WifiSetupFailed((b) => b..message = 'Wifi setup failed.'));
      else
        dispatch(WifiSetupSuccess());
    } on WifiSetupException catch (_) {
      dispatch(WifiSetupFailed((b) => b..message = _.message));
    } on DeviceNotFoundException catch (_) {
      dispatch(WifiSetupFailed((b) => b..message = _.message));
    } catch (_) {
      dispatch(WifiSetupFailed((b) => b..message = _.toString()));
    }
  }

  void dispatch(WifiSetupEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventController.close();
  }
}
