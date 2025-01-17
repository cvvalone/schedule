import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:schedule/src/features/authentication/login/cubit/login_cubit.dart';
import 'package:schedule/src/features/authentication/signup/widget/signup_screen.dart';
import 'package:schedule/src/utils/constants/images.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage: theme.brightness == Brightness.dark
                    ? AssetImage(ScheduleImages.darkAppLogo)
                    : AssetImage(ScheduleImages.lightAppLogo),
              ),
              const SizedBox(
                height: ScheduleSizes.spaceBetweenSections * 2,
              ),
              _EmailInput(),
              const SizedBox(height: ScheduleSizes.spaceBetweenItems),
              _PasswordInput(),
              const SizedBox(height: ScheduleSizes.spaceBetweenItems),
              _LoginButton(),
              const SizedBox(height: ScheduleSizes.spaceBetweenItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "або",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ScheduleSizes.spaceBetweenItems),
              _GoogleLoginButton(),
              const SizedBox(height: ScheduleSizes.spaceBetweenItems),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.email.displayError,
    );

    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Пошта',
        helperText: '',
        errorText: displayError != null ? 'Недійсна пошта спробуйте із @vtc.vn.ua' : null,
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}

class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _isPasswordHidden = true;
  TextEditingController _passwordController = TextEditingController();
  bool _isTextNotEmpty = false;

  @override
  void initState() {
    _passwordController.addListener(() {
      setState(() {
        _isTextNotEmpty = _passwordController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.password.displayError,
    );
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      obscureText: _isPasswordHidden,
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Пароль',
        helperText: '',
        errorText: displayError != null ? 'Недійсний пароль' : null,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: _isTextNotEmpty ? IconButton(
            onPressed: () {
              setState(() {
                _isPasswordHidden = !_isPasswordHidden;
              });
            },
            icon: Icon(Icons.visibility)) : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) return const CircularProgressIndicator();

    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: isValid
          ? () => context.read<LoginCubit>().logInWithCredentials()
          : null,
      child: const Text('УВІЙТИ'),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'УВІЙТИ ЗА ДОПОМОГОЮ GOOGLE',
      ),
      icon: const Icon(FontAwesomeIcons.google),
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => Navigator.of(context).push<void>(SignUpScreen.route()),
      child: Text(
        'СТВОРИТИ АКАУНТ',
      ),
    );
  }
}
