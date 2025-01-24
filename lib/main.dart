import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:schedule/firebase_options.dart';
import 'package:schedule/src/common/bloc/AppBlocObserver.dart';
import 'package:schedule/src/data/repos/authentication/repository/authentication_repository.dart';
import 'package:schedule/src/features/app/app.dart';

Future<void> main() async {
  await initializeDateFormatting('uk_UA', '');
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(App(authenticationRepository: authenticationRepository,));
}
