import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:schedule/src/features/authentication/bloc/authentication_bloc.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                    'Authentication successfull' ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Container(
        width: 300,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
          gradient: const LinearGradient(
            colors: [
              ScheduleColors.fLoginGradientColor,
              ScheduleColors.sLoginGradientColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          backgroundBlendMode: BlendMode.overlay,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5, // Розмиття по горизонталі
              sigmaY: 5, // Розмиття по вертикалі
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Авторизація',
                    style: TextStyle(
                      color: ScheduleColors.wTextColor,
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      height: 35 / 30,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(
                    height: ScheduleSizes.spaceBetweenSections,
                  ),
                  _EmailInput(),
                  _PasswordInput(),
                  PrivacyCheckbox(),
                  SizedBox(
                    height: ScheduleSizes.spaceBetweenItemsIn,
                  ),
                  _LoginButton(),
                  // const SizedBox(height: ScheduleSizes.spaceBetweenItemsIn),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "або",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.grey[700],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: ScheduleSizes.spaceBetweenItemsIn),
                  // _GoogleLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 258,
      child: TextField(
        key: const Key('loginForm_emailInput_textField'),
        // onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          labelText: 'Пошта',
          helperText: '',
          // errorText: asd != null ? 'Спробуйте із @vtc.vn.ua' : null,
          prefixIcon: Icon(Icons.email),
        ),
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
    return SizedBox(
      width: 258,
      child: TextField(
        key: const Key('loginForm_passwordInput_textField'),
        onChanged: (value) {},
        obscureText: _isPasswordHidden,
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Пароль',
          helperText: '',
          // errorText: displayError != null ? 'Недійсний пароль' : null,
          prefixIcon: Icon(Icons.lock),
          suffixIcon: _isTextNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  icon: Icon(Icons.visibility))
              : null,
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: () {
        final authBloc = context.read<AuthenticationBloc>();
        authBloc.add(AuthenticationEvent.logIn(
            login: 'asdasdasd@vtc.vn.ua', password: 'asd'));
      },
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
        onPressed: () {
          final authBloc = context.read<AuthenticationBloc>();
          authBloc.add(AuthenticationEvent.logInWithGoogle());
        });
  }
}

class PrivacyCheckbox extends StatefulWidget {
  @override
  _PrivacyCheckboxState createState() => _PrivacyCheckboxState();
}

class _PrivacyCheckboxState extends State<PrivacyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
        ),
        Container(
          width: 200,
          child: RichText(
            text: TextSpan(
              text: 'Я погоджуюсь з політикою ',
              style: TextStyle(color: ScheduleColors.wBTextColor, fontSize: 11),
              children: [
                TextSpan(
                  text: 'конфіденційності',
                  style: TextStyle(
                    color: ScheduleColors.wBTextColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Політика конфіденційності'),
                          content: Text(
                              'Тут можна відобразити текст політики конфіденційності або здійснити навігацію.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Закрити'),
                            ),
                          ],
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
