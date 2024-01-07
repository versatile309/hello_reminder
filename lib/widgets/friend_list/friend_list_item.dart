import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/style/app_style.dart';
import 'package:hello_reminder/widgets/friend_list/cubit/friend_list_cubit.dart';
import 'package:intl/intl.dart';

class FriendListItem extends StatelessWidget {
  final Friend friend;
  final HelloLog? lastHelloLog;

  const FriendListItem({
    Key? key,
    required this.friend,
    required this.lastHelloLog,
  }) : super(key: key);

  get _formattedTime => lastHelloLog != null
      ? DateFormat('yyyy-MM-dd H:mm:s').format(
          DateTime.fromMillisecondsSinceEpoch(lastHelloLog!.timdstamp,
              isUtc: true))
      : '';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(AppStyle.space2),
      child: Padding(
        padding: EdgeInsets.all(AppStyle.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${friend.firstName} ${friend.lastName}'),
                Row(
                  children: [
                    // HelloActionButton(
                    //   friend: friend,
                    //   helloAction: HelloAction.call,
                    // ),
                    // HelloActionButton(
                    //   friend: friend,
                    //   helloAction: HelloAction.message,
                    // ),
                    // HelloActionButton(
                    //   friend: friend,
                    //   helloAction: HelloAction.katalk,
                    // ),

                    OutlinedButton(
                        onPressed: () {
                          context
                              .read<FriendListCubit>()
                              .updateDate(friendId: friend.id);
                        },
                        child: const Text('연락함')),
                  ],
                )
              ],
            ),
            Text(lastHelloLog != null
                ? '마지막으로 $_formattedTime에 연락'
                : '연락 기록이 없음')
          ],
        ),
      ),
    );
  }
}
