import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/settings/bloc/settings/settings_bloc.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Про нас'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(
              height: 2,
              color: ScheduleColors.greyColor,
              width: calcWidth,
            )),
      ),
    );
  }
}
