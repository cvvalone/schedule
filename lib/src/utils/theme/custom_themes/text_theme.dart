import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleTextTheme{
  ScheduleTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: ScheduleColors.bTextColor,
    ),
    headlineMedium: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: ScheduleColors.bTextColor,
    ),
    headlineSmall: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: ScheduleColors.bTextColor,
    ),

    titleLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ScheduleColors.bTextColor,
    ),
    titleMedium: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ScheduleColors.bTextColor,
    ),
    titleSmall: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ScheduleColors.bTextColor,
    ),

    bodyLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: ScheduleColors.bTextColor,
    ),
    bodyMedium: TextStyle().copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: ScheduleColors.bTextColor,
    ),
    bodySmall: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: ScheduleColors.bTextColor.withOpacity(0.5),
    ),

    labelLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: ScheduleColors.bTextColor,
    ),
    labelMedium: TextStyle().copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: ScheduleColors.bTextColor.withOpacity(0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
    headlineSmall: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.white,
    ),

    titleLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.white,
    ),
    titleMedium: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
    titleSmall: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.white,
    ),

    bodyLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Colors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Colors.white.withOpacity(0.5),
    ),

    labelLarge: TextStyle().copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: Colors.white,
    ),
    labelMedium: TextStyle().copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: Colors.white.withOpacity(0.5),
    ),
  );

}