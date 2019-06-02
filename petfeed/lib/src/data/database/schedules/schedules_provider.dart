import 'package:collection/collection.dart';
import 'package:petfeed/src/data/database/models/schedule.dart';
import 'package:petfeed/src/data/database/schedules/schedules_wirename.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class SchedulesProvider {
  Database db;

  SchedulesProvider();

  final String createQuery = '''
    CREATE TABLE $tableSchedules (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnAmount INTEGER NOT NULL,
      $columnDay TEXT NOT NULL,
      $columnFeedTime INTEGER NOT NULL,
      $columnGroupId TEXT NOT NULL,
      $columnPetId INTEGER NOT NULL,
      $columnUID TEXT NOT NULL
    );
  ''';

  Future open(String path) async {
    // print('open');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(createQuery);
      },
    );
  }

  Future<Schedule> insert(Schedule schedule) async {
    // print('insert');
    schedule.id = await db.insert(tableSchedules, schedule.toMap());

    // print(schedule);

    return schedule;
  }

  Future insertAll(List<Schedule> schedules) async {
    // print('insertall');
    return await db.transaction((txn) async {
      var batch = txn.batch();
      schedules.forEach((schedule) {
        // print(schedule);
        batch.insert(tableSchedules, schedule.toMap());
      });
      return await batch.commit();
    });
  }

  Future<Schedule> getSchedule(int id) async {
    List<Map> maps = await db.query(
      tableSchedules,
      columns: schedulesColumns,
      where: '$columnId = ?',
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Schedule.fromMap(maps.first);
    }

    return null;
  }

  Future<DateTime> getNextFeedTime() async {
    DateTime now = DateTime.now();
    DateFormat day = DateFormat.EEEE();

    List<DateTime> tempTimes = List<DateTime>();
    List<DateTime> timeList = List<DateTime>();

    String searchDay = day.format(now);
    bool found = false;
    bool today = true;

    for (int i = 0; i < 2; i++) {
      tempTimes.clear();
      List<Map> maps = await db.query(
        tableSchedules,
        columns: schedulesColumns,
        where: '$columnDay == ?',
        whereArgs: [searchDay],
      );

      if (maps.isNotEmpty) {
        maps.forEach((data) {
          tempTimes.add(Schedule.fromMap(data).feedTime);
        });
        tempTimes.sort();

        if (today) {
          for (var time in tempTimes) {
            if (time.hour == now.hour) {
              if (time.minute >= now.minute) {
                timeList.add(time);
              }
            } else if (time.hour > now.hour) {
              timeList.add(time);
            }
          }
        } else {
          timeList = tempTimes;
        }
        if (timeList.isNotEmpty) {
          found = true;
          timeList.sort();
          break;
        }
      }
      now = now.add(Duration(days: 1));
      searchDay = day.format(now);
      today = false;
    }
    if (found) {
      return DateTime(
        2019,
        now.month,
        now.day,
        timeList[0].hour,
        timeList[0].minute,
      );
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableSchedules,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    return await db.delete(tableSchedules);
  }

  Future<int> batchDelete(String groupId) async {
    return await db.delete(
      tableSchedules,
      where: '$columnGroupId = ?',
      whereArgs: [groupId],
    );
  }

  Future<int> update(Schedule schedule) async {
    return await db.update(
      tableSchedules,
      schedule.toMap(),
      where: '$columnId = ?',
      whereArgs: [schedule.id],
    );
  }

  Future updateAll(List<Schedule> schedules) async {
    if (schedules.length <= 0) return null;

    return await db.transaction((txn) async {
      var batch = txn.batch();
      schedules.forEach((schedule) {
        batch.update(
          tableSchedules,
          schedule.toMap(),
          where: '$columnId = ?',
          whereArgs: [schedule.id],
        );
      });

      return await batch.commit();
    });
  }

  Future<Map<String, List<Schedule>>> getGroupedSchedules() async {
    List<Map> map = await db.query(tableSchedules, columns: schedulesColumns);

    List<Schedule> schedules = List<Schedule>();

    map.forEach((schedule) => schedules.add(Schedule.fromMap(schedule)));

    Map<String, List<Schedule>> newMap =
        groupBy<Schedule, String>(schedules, (obj) => obj.groupID);

    return newMap;
  }

  Future test() async {
    print(await db.query('schedules'));
  }

  Future close() async => db.close();
}
