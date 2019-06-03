import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:petfeed/src/data/models/pusher_events/pusher_event_model.dart';

class RestartPusherDevice extends PusherEvent {
  final String event = 'petfeed-restart';
  String data;

  RestartPusherDevice({@required data}) {
    this.data = json.encode(data);
  }

  @override
  Map<String, String> toMap() {
    return {
      'event': event,
      'data': data,
    };
  }
}
