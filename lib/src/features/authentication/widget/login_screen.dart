import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:schedule/src/common/bloc/widgets/google_button.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/features/authentication/widget/login_form.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/images.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: ScheduleColors.mainBgColor,
          ),
          SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Gap(100),
                CircleAvatar(
                  radius: 70,
                  child: Theme.of(context).brightness == Brightness.dark
                      ? SvgPicture.asset(ScheduleImages.darkAppLogo)
                      : SvgPicture.asset(ScheduleImages.lightAppLogo),
                  backgroundColor: ScheduleColors.mainBgColor,
                ),
                Gap(65),
                const LoginForm(),
                Gap(20),
                GoogleLoginButton(),
                Gap(170),
                PrivacyCheckbox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
