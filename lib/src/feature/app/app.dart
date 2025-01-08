import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/feature/app/bloc/app_bloc.dart';
import 'package:schedule/src/feature/app/routes/routes.dart';
import 'package:schedule/src/theme.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authentificationRepository,
    super.key,
  }) : _authenticationRepository = authentificationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        )..add(AppUserSubscriptionRequested()),
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
      theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
