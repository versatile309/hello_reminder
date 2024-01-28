import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_reminder/data/repo/friend_repository.dart';
import 'package:hello_reminder/data/repo/hello_log_repository.dart';
import 'package:hello_reminder/data/source/local_storage_service.dart';
import 'package:hello_reminder/home_screen.dart';
import 'package:hello_reminder/widgets/friend_list/cubit/friend_list_cubit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  final localStorage = GetIt.I.registerSingleton(LocalStorageService());
  await localStorage.init();

  final database = await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'hello_reminder.db'),
    onCreate: (db, version) async {
      // Run the CREATE TABLE statement on the database.
      await db.execute(
        'CREATE TABLE friend(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NUL, name TEXT, phone TEXT)',
      );
      await db.execute(
          'CREATE TABLE hellolog(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NUL, friendId INTEGER, timestamp INTEGER, action TEXT)');
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  GetIt.I.registerSingleton<Database>(database);

  final helloLogRepository = GetIt.I.registerSingleton(HelloLogRepository(
    localDatabase: GetIt.I<Database>(),
  ));

  GetIt.I.registerSingleton<FriendRepository>(FriendRepository(
    localDatabase: GetIt.I<Database>(),
    helloLogRepository: helloLogRepository,
  ));

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
          FriendListCubit(
        helloLogRepository: GetIt.I<HelloLogRepository>(),
        friendRepository: GetIt.I<FriendRepository>(),
      ),
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
