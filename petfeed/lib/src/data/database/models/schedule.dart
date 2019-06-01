import 'package:petfeed/src/data/database/schedules/schedules_wirename.dart';

class Schedule {
  int id;
  double amount;
  String day;
  DateTime feedTime;
  String groupID;
  String uID;
  int petID;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      columnAmount: amount,
      columnDay: day,
      columnFeedTime: feedTime.millisecondsSinceEpoch,
      columnGroupId: groupID,
      columnUID: uID,
      columnPetId: petID,
    };

    if (id != null) {
      map[columnId] = id;
    }

    return map;
  }

  Schedule();

  Schedule.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    amount = map[columnAmount];
    day = map[columnDay];
    feedTime = DateTime.fromMillisecondsSinceEpoch(map[columnFeedTime].round());
    groupID = map[columnGroupId];
    uID = map[columnUID];
    petID = map[columnPetId];
  }
}
