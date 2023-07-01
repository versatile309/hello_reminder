import 'package:flutter/material.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/style/app_style.dart';

class HelloActionButton extends StatelessWidget {
  final Friend friend;
  final HelloAction helloAction;
  const HelloActionButton({
    Key? key,
    required this.friend,
    required this.helloAction,
  }) : super(key: key);

  Widget get _getIcon {
    switch (helloAction) {
      case HelloAction.call:
        return const Icon(Icons.call);
      case HelloAction.message:
        return const Icon(Icons.message);
      case HelloAction.katalk:
        return const ImageIcon(AssetImage(AppIcon.kakao));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Padding(
        padding: EdgeInsets.all(AppStyle.space2),
        child: IconButton(
          onPressed: () {},
          icon: _getIcon,
        ),
      ),
    );
  }
}
