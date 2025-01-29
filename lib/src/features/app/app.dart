import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/data/repos/authentication/repository/authentication_repository.dart';
import 'package:schedule/src/features/app/auth_wrapper.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/features/home/home.dart';
import 'package:schedule/src/features/settings/bloc/settings/settings_bloc.dart';
import 'package:schedule/src/features/settings/view/settings_screen.dart';
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
        child: BlocProvider(
          create: (context) => SettingsBloc(),
          child: AppScreen(),
        ),
      ),
    );
  }
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            themeMode: state.themeMode,
            theme: ScheduleTheme.lightTheme,
            darkTheme: ScheduleTheme.darkTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => AuthWrapper(),
              '/home': (context) => HomePage(),
              '/login': (context) => LoginScreen(),
              '/settings': (context) => SettingsScreen(),
              // '/aboutUs': (context)  => AboutScreen(),
            },
          ),
        );
      },
    );
  }
}
