import 'dart:async';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/calibration_bloc/calibration_bloc_export.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/models/pusher_events/restart_pusher_device.dart';
import 'package:petfeed/src/data/models/pusher_events/reverse_pusher_hopper.dart';
import 'package:petfeed/src/data/models/pusher_events/shutdown_pusher_device.dart';
import 'package:petfeed/src/data/models/pusher_events/start_pusher_hopper.dart';
import 'package:petfeed/src/data/models/pusher_events/stop_pusher_hopper.dart';
import 'package:petfeed/src/data/network/pusher/pusher.dart';
import 'package:petfeed/src/data/repository/device_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalibrationBloc extends Bloc {
  final DeviceRepository repository;
  final SharedPreferences preferences;
  final Pusher pusher;

  CalibrationBloc(this.repository, this.preferences, this.pusher) {
    init();
  }

  StreamController<CalibrationEvents> _eventStreamController =
      StreamController<CalibrationEvents>.broadcast();
  Stream get eventStream => _eventStreamController.stream;
  Sink get _eventSink => _eventStreamController.sink;

  void init() {
    _eventStreamController.stream.listen(_mapEventsToState);
  }

  void _mapEventsToState(CalibrationEvents event) {
    if (event is StartHopper) {
      _mapStartHopper(event);
    } else if (event is StopHopper) {
      _mapStopHopper(event);
    } else if (event is ReverseHopper) {
      _mapReverseHopper(event);
    } else if (event is ShutdownDevice) {
      _mapShutdownDevice(event);
    } else if (event is RestartDevice) {
      _mapRestartDevice(event);
    }
  }

  void restartDevice() {
    String token = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    String deviceToken = preferences.get('deviceToken');
    dispatch(
      RestartDevice((b) => b
        ..token = token
        ..deviceID = deviceID
        ..deviceToken = deviceToken),
    );
  }

  void _mapRestartDevice(RestartDevice event) async {
    try {
      Map<String, String> data = {
        'accessToken': event.deviceToken,
      };
      RestartPusherDevice _restart = RestartPusherDevice(data: data);
      pusher.trigger(_restart);
    } on CalibrationException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on NoInternetException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } catch (_) {
      dispatch(CalibrationError((b) => b..message = _.toString()));
    }
  }

  void shutdownDevice() {
    String token = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    String deviceToken = preferences.get('deviceToken');
    dispatch(
      ShutdownDevice((b) => b
        ..token = token
        ..deviceID = deviceID
        ..deviceToken = deviceToken),
    );
  }

  void _mapShutdownDevice(ShutdownDevice event) async {
    try {
      Map<String, String> data = {
        'accessToken': event.deviceToken,
      };
      ShutdownPusherDevice _shutdown = ShutdownPusherDevice(data: data);
      pusher.trigger(_shutdown);
    } on CalibrationException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on NoInternetException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } catch (_) {
      dispatch(CalibrationError((b) => b..message = _.toString()));
    }
  }

  void reverseHopper() {
    String token = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    String deviceToken = preferences.get('deviceToken');
    dispatch(
      ReverseHopper((b) => b
        ..token = token
        ..deviceID = deviceID
        ..deviceToken = deviceToken),
    );
  }

  void _mapReverseHopper(ReverseHopper event) async {
    try {
      Map<String, String> data = {
        'accessToken': event.deviceToken,
      };
      ReversePusherHopper _reverse = ReversePusherHopper(data: data);
      pusher.trigger(_reverse);
    } on CalibrationException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on NoInternetException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } catch (_) {
      dispatch(CalibrationError((b) => b..message = _.toString()));
    }
  }

  void stopHopper() {
    String token = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    String deviceToken = preferences.get('deviceToken');
    dispatch(
      StopHopper((b) => b
        ..token = token
        ..deviceID = deviceID
        ..deviceToken = deviceToken),
    );
  }

  void _mapStopHopper(StopHopper event) async {
    try {
      Map<String, String> data = {
        'accessToken': event.deviceToken,
      };
      StopPusherHopper _stop = StopPusherHopper(data: data);
      pusher.trigger(_stop);
      // final response = await repository.stopHopper(
      //   token: event.token,
      //   deviceID: event.deviceID,
      // );
      // if (response == true) {
      //   dispatch(CalibrationSuccess());
      // } else {
      //   dispatch(
      //     CalibrationError((b) => b..message = 'Something wen\'t wrong!'),
      //   );
      // }
    } on CalibrationException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on NoInternetException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } catch (_) {
      dispatch(CalibrationError((b) => b..message = _.toString()));
    }
  }

  void startHopper() {
    String token = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    String deviceToken = preferences.get('deviceToken');
    dispatch(
      StartHopper((b) => b
        ..token = token
        ..deviceID = deviceID
        ..deviceToken = deviceToken),
    );
  }

  void _mapStartHopper(StartHopper event) async {
    try {
      Map<String, String> data = {
        'accessToken': event.deviceToken,
      };
      StartPusherHopper _start = StartPusherHopper(data: data);
      pusher.trigger(_start);
      // final response = await repository.startHopper(
      //   token: event.token,
      //   deviceID: event.deviceID,
      // );
      // if (response == true) {
      //   dispatch(CalibrationSuccess());
      // } else {
      //   dispatch(
      //     CalibrationError((b) => b..message = 'Something wen\'t wrong!'),
      //   );
      // }
    } on CalibrationException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } on NoInternetException catch (_) {
      dispatch(CalibrationError((b) => b..message = _.message));
    } catch (_) {
      dispatch(CalibrationError((b) => b..message = _.toString()));
    }
  }

  void dispatch(CalibrationEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
  }
}
