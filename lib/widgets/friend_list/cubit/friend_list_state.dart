part of 'friend_list_cubit.dart';

class FriendListState extends Equatable {
  final List<(Friend, HelloLog?)> list;
  const FriendListState(
    this.list,
  );

  factory FriendListState.initial() => const FriendListState([]);

  @override
  List<Object> get props => [list];

  FriendListState copyWith({
    List<(Friend, HelloLog?)>? list,
  }) {
    return FriendListState(
      list ?? this.list,
    );
  }

  @override
  String toString() => 'FriendListState(list: $list)';
}
