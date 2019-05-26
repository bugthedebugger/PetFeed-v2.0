import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/device_register_bloc/device_register_bloc_events.dart';
import 'package:petfeed/src/data/exceptions/device_registration_exception.dart';
import 'package:petfeed/src/data/exceptions/no_internet_exception.dart';
import 'package:petfeed/src/data/exceptions/unauthenticated.dart';
import 'package:petfeed/src/data/network/pusher/pusher.dart';
import 'package:petfeed/src/data/repository/device_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceRegisterBloc extends Bloc {
  final DeviceRepository repository;
  final SharedPreferences preferences;
  final Pusher pusher;

  String _deviceID;
  String _password;
  String _deviceToken;

  bool listeningStatus = false;
  bool listeningPiConfigure = false;

  StreamController<DeviceRegisterEvents> _eventStreamController =
      StreamController<DeviceRegisterEvents>.broadcast();
  Stream<DeviceRegisterEvents> get eventStream => _eventStreamController.stream;
  Sink<DeviceRegisterEvents> get _eventSink => _eventStreamController.sink;

  Stream get _pusherStatusStream => pusher.statusStream;
  Stream get _pusherPiConfigureStream => pusher.piConfigureStream;

  StreamSubscription _statusSubscription;
  StreamSubscription _piConfigureSubscription;

  DeviceRegisterBloc(this.repository, this.preferences, this.pusher) {
    init();
  }

  void init() {
    _eventStreamController.stream.listen(_mapEventsToState);
  }

  void pusherListen() {
    if (!listeningStatus) {
      listeningStatus = true;
      _statusSubscription = _pusherStatusStream.listen(_mapRegister);
      _piConfigureSubscription = _pusherPiConfigureStream.listen(_mapConfigure);
    }
  }

  void _mapConfigure(data) {
    Map<String, dynamic> mappedData = json.decode(data);
    try {
      if (mappedData['status'] == 'success') {
        print(_deviceToken);
        preferences.setString('deviceToken', _deviceToken);
        dispatch(DeviceRegisterSuccess());
      }
    } catch (_) {
      dispatch(
        DeviceRegisterError((b) => b..message = _.toString()),
      );
    }
  }

  void _mapRegister(data) {
    Map<String, dynamic> mappedData = json.decode(data);
    try {
      if (mappedData['status'] == 'online')
        dispatch(
          SendRegisterToServer((b) => b
            ..deviceID = _deviceID
            ..password = _password),
        );
    } catch (_) {
      dispatch(
        DeviceRegisterError((b) => b..message = _.toString()),
      );
    }
  }

  void _mapEventsToState(DeviceRegisterEvents event) {
    if (event is DeviceRegisterInitiated) {
      _mapDeviceRegisterInitiated(event);
    } else if (event is SendRegisterToServer) {
      _mapSendRegisterToServer(event);
    }
  }

  void _mapSendRegisterToServer(SendRegisterToServer event) async {
    try {
      String token = preferences.get('token');
      final response = await repository.registerDevice(
          token: token, deviceID: event.deviceID, password: event.password);
      if (response != null) {
        _deviceToken = response.token;
        // print(_deviceToken);
        preferences.setString('deviceToken', _deviceToken);
      }
    } on NoInternetException catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.message));
    } on DeviceRegistrationException catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.message));
    } catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.toString()));
    }
  }

  void registerDevice({@required String id, @required String password}) {
    dispatch(
      DeviceRegisterInitiated((b) => b
        ..deviceID = id
        ..password = password),
    );
  }

  void _mapDeviceRegisterInitiated(DeviceRegisterInitiated event) async {
    try {
      String token = preferences.get('token');
      if (!listeningStatus) {
        await pusher.connect(event.deviceID, token);
        pusherListen();
      }
      _deviceID = event.deviceID;
      _password = event.password;
      preferences.setString('deviceID', event.deviceID);
      final response =
          await repository.getStatus(token: token, deviceID: event.deviceID);
      if (response == false) {
        dispatch(
          DeviceRegisterError((b) => b..message = 'Could not find the device.'),
        );
      }
    } on NoInternetException catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.message));
    } on UnauthenticatedException catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.message));
    } on DeviceRegistrationException catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.message));
    } catch (_) {
      dispatch(DeviceRegisterError((b) => b..message = _.toString()));
    }
  }

  void dispatch(DeviceRegisterEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
    // _statusSubscription?.cancel();
    // _piConfigureSubscription?.cancel();
  }
}
