import 'package:flutter/material.dart';

class ScheduleOutlinedButtonTheme{
  ScheduleOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.grey,
      // fixedSize: const Size(120, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(width: 1.5,color: Colors.blue,),
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ));
  
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.grey,
      // fixedSize: const Size(120, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: null,
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ));
}