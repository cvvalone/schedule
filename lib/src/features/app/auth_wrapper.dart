import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/authentication/authertication.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (!state.isAuthenticated) {
            Navigator.pushReplacementNamed(context, '/login');
          } else {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                  
                },
                child: Text('Login')),
          );
        },
      ),
    );
  }
}
