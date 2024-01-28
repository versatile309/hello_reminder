import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/data/repo/friend_repository.dart';
import 'package:hello_reminder/data/repo/hello_log_repository.dart';

part 'friend_list_state.dart';

class FriendListCubit extends Cubit<FriendListState> {
  final HelloLogRepository helloLogRepository;
  final FriendRepository friendRepository;
  FriendListCubit({
    required this.helloLogRepository,
    required this.friendRepository,
  }) : super(FriendListState.initial());

  Future<void> fetch() async {
    emit(FriendListState.initial());
    try {
      final result = await friendRepository.getAllFirendsWithLastHelloLog();

      emit(state.copyWith(list: result));
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDate({required int friendId}) async {
    final tempList = List.of(state.list);

    final item =
        tempList.where((element) => element.$1.id == friendId).firstOrNull;

    if (item != null) {
      final index = tempList.indexOf(item);
      final newLog =
          item.$2?.copyWith(timestamp: DateTime.now().millisecondsSinceEpoch);

      tempList[index] = (item.$1, newLog);

      await helloLogRepository.updateHelloLog(newLog!);

      emit(state.copyWith(list: tempList));
    }
  }
}
