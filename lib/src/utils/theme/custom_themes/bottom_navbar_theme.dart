import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleBottomNavbarTheme{
  ScheduleBottomNavbarTheme._();

  static final lightBottomNavbarTheme = BottomNavigationBarThemeData(
    backgroundColor: ScheduleColors.bottomNavBarColor,
    selectedItemColor: ScheduleColors.bActColor,
    unselectedItemColor: ScheduleColors.greyColor,
  );
  
  static final darkBottomNavbarTheme = BottomNavigationBarThemeData(
    backgroundColor: ScheduleColors.bottomNavBarColor,
    selectedItemColor: ScheduleColors.bActColor,
    unselectedItemColor: ScheduleColors.greyColor,
  );

}