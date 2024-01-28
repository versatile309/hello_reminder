import 'package:hello_reminder/data/enums/db_table_name.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/data/repo/hello_log_repository.dart';
import 'package:sqflite/sqflite.dart';

class FriendRepository {
  final Database localDatabase;
  final HelloLogRepository helloLogRepository;
  late String tableName;

  FriendRepository({
    required this.localDatabase,
    required this.helloLogRepository,
  }) {
    tableName = DbTableName.friend.name;
  }

  Future<void> addFriend(Friend friend) async {
    await localDatabase.insert(tableName, friend.toJson()..remove('id'));
  }

  Future<Friend> getFriend(int friendId) async {
    final result = await localDatabase.query(
      tableName,
      where: 'id = ?',
      whereArgs: [friendId],
    );

    if (result.isNotEmpty) {
      final firstItem = result.first;
      return Friend.fromJson(firstItem);
    }

    throw Exception();
  }

  Future<List<Friend>> getAllFriends() async {
    final result = await localDatabase.query(tableName);

    return result.map((e) => Friend.fromJson(e)).toList();
  }

  Future<List<(Friend, HelloLog?)>> getAllFirendsWithLastHelloLog() async {
    final List<Friend> friends = await getAllFriends();
    final List<HelloLog> helloLogs = await helloLogRepository.getAllHelloLogs();

    List<(Friend, HelloLog?)> combinedDataList = [];

    for (var friend in friends) {
      final List<HelloLog> friendHelloLogs = helloLogs
          .where((helloLog) => helloLog.friendId == friend.id)
          .toList();

      if (friendHelloLogs.isNotEmpty) {
        // Sort helloLogs by timestamp in descending order
        friendHelloLogs.sort((a, b) => b.timestamp.compareTo(a.timestamp));

        // Take the latest helloLog for the friend
        final latestHelloLog = friendHelloLogs.first;

        combinedDataList.add((friend, latestHelloLog));
      } else {
        combinedDataList.add((friend, null));
      }
    }

    return combinedDataList;
  }

  Future<void> updateFriend(Friend friend) async {
    await localDatabase.update(
      'friends',
      friend.toJson(),
      where: 'id = ?',
      whereArgs: [friend.id],
    );
  }

  Future<void> deleteFriend(int id) async {
    await localDatabase.delete(
      'friends',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
