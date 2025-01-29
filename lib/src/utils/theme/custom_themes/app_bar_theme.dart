import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleAppBarTheme{
  ScheduleAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),
  );
  
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
  );

}