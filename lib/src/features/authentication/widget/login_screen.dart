import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/src/features/authentication/login/cubit/login_cubit.dart';
import 'package:schedule/src/features/authentication/widget/login_form.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ScheduleColors.lbActColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: ScheduleColors.mainBgColor,
          ),
          Positioned.fill(
            child: Image.asset(
              ScheduleImages.bigBackgroundPic,
              // alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 64,
                  child: Theme.of(context).brightness == Brightness.dark
                      ? SvgPicture.asset(ScheduleImages.darkAppLogo)
                      : SvgPicture.asset(ScheduleImages.lightAppLogo),
                  backgroundColor: ScheduleColors.mainBgColor,
                ),
                SizedBox(height: 65,),
                BlocProvider(
                  child: const LoginForm(),
                  create: (_) =>
                      LoginCubit(context.read<AuthenticationRepository>()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
