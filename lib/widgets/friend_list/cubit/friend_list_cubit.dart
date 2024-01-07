import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/data/repo/hello_log_repository.dart';

part 'friend_list_state.dart';

class FriendListCubit extends Cubit<FriendListState> {
  final HelloLogRepository helloLogRepository;
  FriendListCubit({required this.helloLogRepository})
      : super(FriendListState.initial());

  Future<void> fetch() async {
    try {
      final result = await helloLogRepository.get();

      emit(state.copyWith(list: result));
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDate({required String friendId}) async {
    final tempList = List.of(state.list);

    final item =
        tempList.where((element) => element.$1.id == friendId).firstOrNull;

    if (item != null) {
      final index = tempList.indexOf(item);
      final newLog = item.$2 == null
          ? HelloLog(
              id: '1',
              timdstamp: DateTime.now().millisecondsSinceEpoch,
              helloAction: HelloAction.call)
          : item.$2?.copyWith(timdstamp: DateTime.now().millisecondsSinceEpoch);

      tempList[index] = (item.$1, newLog);

      await helloLogRepository.set(tempList);

      emit(state.copyWith(list: tempList));
    }
  }
}
