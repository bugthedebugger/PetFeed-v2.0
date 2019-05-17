import 'dart:async';

import 'package:flutter/services.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/device_register_bloc/device_register_bloc_events.dart';
import 'package:petfeed/src/data/network/pusher/pusher.dart';

class DeviceRegisterBloc extends Bloc {
  StreamController<DeviceRegisterEvents> _eventStreamController =
      StreamController<DeviceRegisterEvents>.broadcast();
  Stream<DeviceRegisterEvents> get eventStream => _eventStreamController.stream;
  Sink<DeviceRegisterEvents> get _eventSink => _eventStreamController.sink;

  Pusher _pusher = Pusher();
  Stream get _pusherStatusStream => _pusher.statusStream;

  DeviceRegisterBloc() {
    init();
  }

  void init() {
    _eventStreamController.stream.listen(_mapEventsToState);
    _pusherStatusStream.listen(_mapRegister);
  }

  void _mapRegister(data) {
    print(data);
  }

  void _mapEventsToState(DeviceRegisterEvents event) {
    if (event is DeviceRegisterInitiated) {
      _mapDeviceRegisterInitiated(event);
    }
  }

  void _mapDeviceRegisterInitiated(DeviceRegisterInitiated event) async {
    try {} catch (_) {}
  }

  void dispatch(DeviceRegisterEvents event) {
    _eventSink.add(event);
  }

  @override
  void dispose() {
    _eventStreamController.close();
  }
}
