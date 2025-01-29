import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/authentication/authertication.dart';
import 'package:schedule/src/features/settings/bloc/settings/settings_bloc.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = {
    'avatar': 'assets/avatarImage.png',
  };
  @override
  Widget build(BuildContext context) {
    bool darkTheme = Theme.of(context).brightness == Brightness.dark;
    final bloc = context.read<SettingsBloc>();
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Налаштування'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(
              height: 2,
              color: ScheduleColors.greyColor,
              width: calcWidth,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Темний режим',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Switch(
                  value: darkTheme,
                  onChanged: (changed) {
                    setState(() {
                      bloc.add(SettingsEvent.toggleTheme());
                    });
                  },
                ),
              ],
            ),
            Divider(
              color: ScheduleColors.lightGreyColor,
              thickness: 2,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
