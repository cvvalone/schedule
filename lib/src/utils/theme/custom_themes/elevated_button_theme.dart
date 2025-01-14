import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleElevatedButtonTheme{
  ScheduleElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ScheduleColors.bTextColor,
      backgroundColor: ScheduleColors.bActColor,
      padding: const EdgeInsets.all(16),
      disabledBackgroundColor: ScheduleColors.gTextColor,
      disabledForegroundColor: ScheduleColors.lbActColor,
      // fixedSize: const Size(120, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: null,
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      iconColor: ScheduleColors.bTextColor,
    ));
  
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ScheduleColors.wTextColor,
      backgroundColor: ScheduleColors.bActColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      // fixedSize: const Size(120, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: null,
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      iconColor: ScheduleColors.wTextColor,
    ));
}