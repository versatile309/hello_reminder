import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_reminder/widgets/friend_list/cubit/friend_list_cubit.dart';
import 'package:hello_reminder/widgets/friend_list/friend_list_item.dart';

class FriendList extends StatelessWidget {

  const FriendList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendListCubit, FriendListState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => FriendListItem(
            friend: state.list[index].$1,
            lastHelloLog: state.list[index].$2,
          ),
          itemCount: state.list.length,
        );
      },
    );
  }
}
