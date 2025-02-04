import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:schedule/firebase_options.dart';
import 'package:schedule/src/common/bloc/AppBlocObserver.dart';
import 'package:schedule/src/data/repos/authentication/authentication_repository.dart';
import 'package:schedule/src/data/repos/notification/service/notification_service.dart';
import 'package:schedule/src/data/repos/schedule/schedule_repository.dart';
import 'package:schedule/src/data/services/api_service.dart';
import 'package:schedule/src/features/app/app.dart';

Future<void> main() async {
  await initializeDateFormatting('uk_UA', '');
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final locator = GetIt.instance;

  void setupLocator() {
    locator.registerLazySingleton<ScheduleRepository>(
        () => MockScheduleRepository());
    locator.registerLazySingleton<ApiService>(() => MockApiService());
  }

  setupLocator();

  final authenticationRepository = AuthenticationRepository();

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
