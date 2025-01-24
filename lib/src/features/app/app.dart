import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/data/repos/authentication/repository/authentication_repository.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/features/home/home.dart';
import 'package:schedule/src/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AuthenticationBloc(
          repository: _authenticationRepository,
        ),
        child: const AppScreen(),
      ),
    );
  }
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ScheduleTheme.lightTheme,
      darkTheme: ScheduleTheme.darkTheme,
      home: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      routes: {
        '/home': (context) => HomePage(), // Головна сторінка
        '/login': (context) => LoginScreen(), // Сторінка авторизації
      },
    );
  }
}
