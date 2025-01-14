import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleBottomNavbarTheme{
  ScheduleBottomNavbarTheme._();

  static final lightBottomNavbarTheme = BottomNavigationBarThemeData(
    backgroundColor: ScheduleColors.sBgColor,
    selectedItemColor: ScheduleColors.bActColor,
    unselectedItemColor: ScheduleColors.gTextColor,
  );
  
  static final darkBottomNavbarTheme = BottomNavigationBarThemeData(
    backgroundColor: ScheduleColors.tBgColor,
    selectedItemColor: ScheduleColors.bActColor,
    unselectedItemColor: ScheduleColors.gTextColor,
  );

}