import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/sizes.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(DateHelper.formatDate(DateTime.now()), style: TextStyle(fontSize: ScheduleSizes.fontSizeLg),),
      ),
    );
  }
}