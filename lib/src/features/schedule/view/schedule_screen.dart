import 'package:flutter/material.dart';


class ScheduleMainScreen extends StatefulWidget {
  const ScheduleMainScreen({super.key});

  @override
  State<ScheduleMainScreen> createState() => _ScheduleMainScreenState();
}

class _ScheduleMainScreenState extends State<ScheduleMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Розклад'),
      ),
    );
  }
}