import 'dart:async';
import 'package:flutter/services.dart';
import 'package:petfeed/src/data/models/pusher_events/pusher_event_model.dart';
import 'package:petfeed/src/data/network/pusher/pusher-credentials.dart';

class Pusher {
  String deviceID;

  MethodChannel _platform;
  EventChannel _statusChannel;
  EventChannel _piConfigure;

  Map<String, String> _credentials;

  Stream get statusStream => _statusChannel.receiveBroadcastStream();
  Stream get piConfigureStream => _piConfigure.receiveBroadcastStream();

  Pusher() {
    _platform = MethodChannel('petfeed/pusher-initialize');
    _statusChannel = EventChannel('petfeed/pusher-status');
    _piConfigure = EventChannel('petfeed/pusher-configure-status');
  }

  Future connect(String deviceID, String accessToken) async {
    bool connection = await pusherConnection();

    if (!connection) {
      this.deviceID = deviceID;
      _credentials = PusherCredentials.toMap();
      _credentials.addAll({'channel': deviceID, 'token': accessToken});
      _platform.invokeMethod('pusher-initialize', _credentials);
    }

    return;
  }

  Future<bool> pusherConnection() async {
    return _platform.invokeMethod('pusher-status');
  }

  void dispose() {
    _platform.invokeMethod('pusher-dispose');
  }

  void trigger(PusherEvent event) {
    _platform.invokeMethod('pusher-trigger', event.toMap());
  }
}
