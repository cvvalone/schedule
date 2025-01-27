import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/images.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        key: const Key('loginForm_googleLogin_raisedButton'),
        label: const Text(
          'Увійти за допомогою Google',
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ScheduleColors.wBTextColor),
        ),
        icon: SvgPicture.asset(ScheduleImages.googleColorLogo, height: 18, width: 18,),
        onPressed: () {
          final authBloc = context.read<AuthenticationBloc>();
          authBloc.add(AuthenticationEvent.logInWithGoogle());
        });
  }
}
