import 'package:flutter/material.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/widgets/common/base_screen.dart';
import 'package:hello_reminder/widgets/friend_list/friend_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('연락 안한 순'),
            Expanded(
              child: FriendList(friends: [
                (
                  Friend(
                    id: '1',
                    firstName: 'jone',
                    lastName: 'doe',
                  ),
                  HelloLog(
                    id: '1',
                    timdstamp: 1688190817,
                    helloAction: HelloAction.call,
                  )
                ),
                (
                  Friend(
                    id: '1',
                    firstName: '한',
                    lastName: '유정',
                  ),
                  HelloLog(
                    id: '1',
                    timdstamp: 1688190817,
                    helloAction: HelloAction.call,
                  )
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
