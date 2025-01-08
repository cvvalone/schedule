import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/feature/authentication/login/cubit/login_cubit.dart';
import 'package:schedule/src/feature/authentication/login/widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: BlocProvider(
            child: const LoginForm(),
            create: (_) =>
                LoginCubit(context.read<AuthenticationRepository>())),
      ),
    );
  }
}
