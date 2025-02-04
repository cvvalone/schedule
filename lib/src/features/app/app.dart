import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/data/repos/authentication/authentication_repository.dart';
import 'package:schedule/src/data/repos/notification/service/notification_service.dart';
import 'package:schedule/src/features/aboutUs/widget/about_us_screen.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/features/home/home.dart';
import 'package:schedule/src/features/notification/widget/notification_screen.dart';
import 'package:schedule/src/features/settings/bloc/settings/settings_bloc.dart';
import 'package:schedule/src/features/settings/view/settings_screen.dart';
import 'package:schedule/src/utils/theme/theme.dart';

class App extends StatefulWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    NotificationService _notifService = NotificationService.instance;
    _notifService.initPermissions(topic: 'news', context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget._authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AuthenticationBloc(
          repository: widget._authenticationRepository,
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
  AppScreen({super.key});
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            scaffoldMessengerKey: scaffoldMessengerKey,
            themeMode: state.themeMode,
            theme: ScheduleTheme.lightTheme,
            darkTheme: ScheduleTheme.darkTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => LoginScreen(),
              '/notifications': (context) => NotificationScreen(),
              '/home': (context) => HomePage(),
              '/login': (context) => LoginScreen(),
              '/settings': (context) => SettingsScreen(),
              '/aboutUs': (context) => AboutUsScreen(),
            },
          ),
        );
      },
    );
  }
}
