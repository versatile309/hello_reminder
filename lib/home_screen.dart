import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_reminder/data/friend.dart';
import 'package:hello_reminder/data/repo/friend_repository.dart';
import 'package:hello_reminder/widgets/common/base_screen.dart';
import 'package:hello_reminder/widgets/friend_list/cubit/friend_list_cubit.dart';
import 'package:hello_reminder/widgets/friend_list/friend_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: BlocProvider.value(
        value: context.read<FriendListCubit>()..fetch(),
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () => _showAddFriendDialog(context),
                    icon: const Icon(Icons.person_add))
              ],
            ),
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('연락 안한 순'),
                Expanded(
                  child: FriendList(),
                ),
              ],
            )),
      ),
    );
  }

  _showAddFriendDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AddFriendDialog();
        });
  }
}

class AddFriendDialog extends StatefulWidget {
  const AddFriendDialog({
    super.key,
  });

  @override
  State<AddFriendDialog> createState() => _AddFriendDialogState();
}

class _AddFriendDialogState extends State<AddFriendDialog> {
  String name = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('친구 추가'),
            TextFormField(
              onChanged: (name) {
                this.name = name;
              },
              decoration: const InputDecoration(label: Text('이름')),
            ),
            TextFormField(
              onChanged: (phone) {
                this.phone = phone;
              },
              decoration: const InputDecoration(label: Text('전화번호')),
            ),
            ElevatedButton(
              onPressed: () async {
                if (name.isNotEmpty && phone.isNotEmpty) {
                  GetIt.I<FriendRepository>()
                      .addFriend(Friend(id: 0, name: name, phone: phone))
                      .then((value) => context
                          .read<FriendListCubit>()
                          .fetch()
                          .then((value) => Navigator.pop(context)));
                }
              },
              child: const Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
