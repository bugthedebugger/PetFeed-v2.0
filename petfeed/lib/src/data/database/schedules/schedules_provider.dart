import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:petfeed/src/data/database/models/schedule.dart';
import 'package:petfeed/src/data/database/schedules/schedules_wirename.dart';
import 'package:sqflite/sqflite.dart';

class SchedulesProvider {
  Database db;

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
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(createQuery);
    });
  }

  Future<Schedule> insert(Schedule schedule) async {
    schedule.id = await db.insert(tableSchedules, schedule.toMap());

    print(schedule);

    return schedule;
  }

  Future insertAll(List<Schedule> schedules) async {
    return await db.transaction((txn) async {
      var batch = txn.batch();
      schedules.forEach((schedule) {
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

  Future<int> delete(int id) async {
    return await db.delete(
      tableSchedules,
      where: '$columnId = ?',
      whereArgs: [id],
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
        groupBy<Schedule, String>(schedules, (obj) => obj.uID);

    return newMap;
  }

  Future close() async => db.close();
}
