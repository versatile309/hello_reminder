import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/widgets/common/base_screen.dart';
import 'package:hello_reminder/widgets/friend_list/cubit/friend_list_cubit.dart';
import 'package:hello_reminder/widgets/friend_list/friend_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('연락 안한 순'),
            Expanded(
              child: BlocProvider.value(
                value: context.read<FriendListCubit>()..fetch(),
                child: const FriendList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
