import 'package:flutter/material.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/widgets/friend_list/friend_list_item.dart';

class FriendList extends StatelessWidget {
  final List<(Friend, HelloLog?)> friends;

  const FriendList({
    Key? key,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => FriendListItem(
        friend: friends[index].$1,
        lastHelloLog: friends[index].$2,
      ),
      itemCount: friends.length,
    );
  }
}
