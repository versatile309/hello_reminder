import 'package:flutter/material.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/style/app_style.dart';
import 'package:hello_reminder/widgets/friend_list/hello_action_button.dart';
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
      ? DateFormat('yyyy-MM-dd').format(
          DateTime.fromMillisecondsSinceEpoch(lastHelloLog!.timdstamp * 1000))
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
                    HelloActionButton(
                      friend: friend,
                      helloAction: HelloAction.call,
                    ),
                    HelloActionButton(
                      friend: friend,
                      helloAction: HelloAction.message,
                    ),
                    HelloActionButton(
                      friend: friend,
                      helloAction: HelloAction.katalk,
                    ),
                  ],
                )
              ],
            ),
            Text(lastHelloLog != null
                ? '마지막으로 $_formattedTime에 ${lastHelloLog!.helloAction.displayName}(으)로 연락'
                : '연락 기록이 없음')
          ],
        ),
      ),
    );
  }
}
