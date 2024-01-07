import 'dart:convert';

import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/data/source/local_storage_service.dart';

class HelloLogRepository {
  final LocalStorageService localStorageService;

  HelloLogRepository({required this.localStorageService});

  Future<List<(Friend, HelloLog?)>> get() async {
    final lawResult = await localStorageService.getByKey('logs');

    if (lawResult == null) return [];

    final jsonResult = json.decode(lawResult);

    return (jsonResult as List<dynamic>).map<(Friend, HelloLog)>((e) {
      return (Friend.fromJson(e['friend']), HelloLog.fromJson(e['log']));
    }).toList();
  }

  Future<void> set(List<(Friend, HelloLog?)> logs) async {
    await localStorageService.setByKey(
        'logs',
        json.encode(logs
            .map((e) => {'friend': e.$1.toJson(), 'log': e.$2?.toJson()})
            .toList()));
  }
}
