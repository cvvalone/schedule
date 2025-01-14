import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:schedule/firebase_options.dart';
import 'package:schedule/src/common/bloc/AppBlocObserver.dart';
import 'package:schedule/src/data/repos/daily_task/model/daily_task.dart';
import 'package:schedule/src/features/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  

  final authentificationRepository = AuthenticationRepository();
  await authentificationRepository.user.first;

  await Hive.initFlutter();
  Hive.registerAdapter(DailyTaskAdapter());
  await Hive.openBox<DailyTask>('tasks');

  runApp(App(authentificationRepository: authentificationRepository,));
}
