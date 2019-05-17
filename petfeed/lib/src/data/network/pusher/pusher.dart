import 'dart:async';

import 'package:flutter/services.dart';
import 'package:petfeed/src/data/network/pusher/pusher-credentials.dart';

class Pusher {
  String deviceID;

  MethodChannel _platform;
  EventChannel _statusChannel;

  Map<String, String> credentials;

  Stream get statusStream => _statusChannel.receiveBroadcastStream();

  Pusher() {
    _platform = MethodChannel('petfeed/pusher-initialize');
    _statusChannel = EventChannel('petfeed/pusher-status');
  }

  void connect(String deviceID) {
    this.deviceID = deviceID;
    credentials = PusherCredentials.toMap();
    credentials.addAll({'channel': deviceID});
    _platform.invokeMethod('pusher-initialize', credentials);
  }

  void dispose() {
    _platform.invokeMethod('pusher-dispose');
  }
}
