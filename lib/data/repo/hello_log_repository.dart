import 'package:hello_reminder/data/enums/db_table_name.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:sqflite/sqflite.dart';

class HelloLogRepository {
  final Database localDatabase;
  late String tableName;

  HelloLogRepository({required this.localDatabase}) {
    tableName = DbTableName.hellolog.name;
  }

  Future<List<HelloLog>> getAllHelloLogs() async {
    final List<Map<String, dynamic>> maps =
        await localDatabase.query(tableName);
    return List.generate(maps.length, (i) {
      return HelloLog(
        id: maps[i]['id'],
        friendId: maps[i]['friendId'],
        timestamp: maps[i]['timestamp'],
        action: HelloAction.values.firstWhere(
            (e) => e.toString() == 'HelloAction.${maps[i]['action']}'),
      );
    });
  }

  Future<void> insertHelloLog(HelloLog helloLog) async {
    await localDatabase.insert(
      tableName,
      helloLog.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateHelloLog(HelloLog helloLog) async {
    await localDatabase.update(
      tableName,
      helloLog.toJson(),
      where: 'id = ?',
      whereArgs: [helloLog.id],
    );
  }

  Future<void> deleteHelloLog(String id) async {
    await localDatabase.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
