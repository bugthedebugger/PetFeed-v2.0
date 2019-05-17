import 'dart:async';

import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/calibration_bloc/calibration_bloc_export.dart';
import 'package:petfeed/src/data/exceptions/custom_exceptions.dart';
import 'package:petfeed/src/data/repository/device_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalibrationBloc extends Bloc {
  final DeviceRepository repository;
  final SharedPreferences preferences;

  CalibrationBloc(this.repository, this.preferences) {
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
    }
  }

  void stopHopper() {
    String token = preferences.get('token');
    String deviceID = preferences.get('deviceID');
    dispatch(
      StopHopper((b) => b
        ..token = token
        ..deviceID = deviceID),
    );
  }

  void _mapStopHopper(StopHopper event) async {
    try {
      final response = await repository.stopHopper(
        token: event.token,
        deviceID: event.deviceID,
      );
      if (response == true) {
        dispatch(CalibrationSuccess());
      } else {
        dispatch(
          CalibrationError((b) => b..message = 'Something wen\'t wrong!'),
        );
      }
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
    dispatch(
      StartHopper((b) => b
        ..token = token
        ..deviceID = deviceID),
    );
  }

  void setupComplete(){
    preferences.setBool('setup', true);
  }

  void _mapStartHopper(StartHopper event) async {
    try {
      final response = await repository.startHopper(
        token: event.token,
        deviceID: event.deviceID,
      );
      if (response == true) {
        dispatch(CalibrationSuccess());
      } else {
        dispatch(
          CalibrationError((b) => b..message = 'Something wen\'t wrong!'),
        );
      }
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
