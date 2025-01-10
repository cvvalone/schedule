import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleTextButtonTheme{
  ScheduleTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor:  ScheduleColors.wTextColor,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.grey,
      // fixedSize: const Size(120, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: ScheduleColors.bActColor),
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color:  ScheduleColors.wTextColor,
      ),
    ));
  
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ScheduleColors.wTextColor,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.grey,
      // fixedSize: const Size(120, 40),
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ));
}