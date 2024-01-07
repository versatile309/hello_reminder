import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
import 'package:hello_reminder/data/hello_log.dart';
import 'package:hello_reminder/data/repo/hello_log_repository.dart';
import 'package:hello_reminder/data/source/local_storage_service.dart';
import 'package:hello_reminder/home_screen.dart';
import 'package:hello_reminder/widgets/friend_list/cubit/friend_list_cubit.dart';

import 'data/friend.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  final localStorage = GetIt.I.registerSingleton(LocalStorageService());
  await localStorage.init();

  GetIt.I
      .registerSingleton(HelloLogRepository(localStorageService: localStorage));
}

class AppRoutes {
  static const home = '/';
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FriendListCubit(helloLogRepository: GetIt.I<HelloLogRepository>()),
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
