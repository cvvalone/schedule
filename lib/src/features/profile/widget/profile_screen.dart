import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:schedule/src/common/bloc/widgets/profile_settings_item.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const user = {
    'avatar': 'assets/avatarImage.jpg',
    'name': 'Федотов Олексій',
    'group': '4КІ1',
  };
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 60,
                // backgroundImage: AssetImage(user['avatar']!),
                backgroundColor: ScheduleColors.gSucColor,
              ),
              Gap(20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    user['name']!,
                    style: TextStyle(
                      fontSize: 30,
                      color: ScheduleColors.bTextColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'група: ${user['group']!}',
                    style: TextStyle(
                      fontSize: 15,
                      color: ScheduleColors.bLTextColor,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              Gap(8),
              Divider(
                color: ScheduleColors.greyColor,
                height: 2,
                thickness: 2,
              ),
              Gap(20),
              Expanded(
                child: ListView(
                  children: [
                    ProfileSettingsItem(
                      title: 'Про нас',
                      route: '/aboutUs',
                    ),
                    Divider(
                      color: ScheduleColors.lightGreyColor,
                      thickness: 2,
                      height: 2,
                    ),
                    ProfileSettingsItem(
                      title: 'Налаштування',
                      route: '/settings',
                    ),
                    Divider(
                      color: ScheduleColors.lightGreyColor,
                      thickness: 2,
                      height: 2,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      //TODO: LOGOUT LOGIC
                    },
                    child: Text(
                      'Вихід',
                      style: TextStyle(
                          color: ScheduleColors.redColor,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Text(
                    'Версія 0.0.0',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
