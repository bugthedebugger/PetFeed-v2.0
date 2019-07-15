import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:petfeed/src/data/models/pusher_events/pusher_event_model.dart';

class StartPusherHopper extends PusherEvent {
  final String event = 'petfeed-start-hopper';
  String data;

  StartPusherHopper({@required data}) {
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
