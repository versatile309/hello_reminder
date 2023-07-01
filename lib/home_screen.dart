import 'package:flutter/material.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/widgets/friend_list/friend_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FriendList(friends: [
        (
          Friend(
            id: '1',
            firstName: 'jone',
            lastName: 'doe',
          ),
          HelloLog(
            id: '1',
            timdstamp: '11111111',
            helloAction: HelloAction.call,
          )
        ),
      ]),
    );
  }
}
