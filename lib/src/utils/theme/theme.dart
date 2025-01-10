import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/chip_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/text_button_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/text_form_theme.dart';
import 'package:schedule/src/utils/theme/custom_themes/text_theme.dart';

class ScheduleTheme{
  ScheduleTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ScheduleTextTheme.lightTextTheme,
    chipTheme: ScheduleChipTheme.lightChipTheme,
    appBarTheme: ScheduleAppBarTheme.lightAppBarTheme,
    checkboxTheme: ScheduleCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: ScheduleBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: ScheduleOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: ScheduleElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: ScheduleTextFormFieldTheme.lightTextFormFieldTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: ScheduleColors.fBgColor,
    textTheme: ScheduleTextTheme.darkTextTheme,
    chipTheme: ScheduleChipTheme.darkChipTheme,
    appBarTheme: ScheduleAppBarTheme.darkAppBarTheme,
    checkboxTheme: ScheduleCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: ScheduleBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: ScheduleOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: ScheduleElevatedButtonTheme.darkElevatedButtonTheme,
    textButtonTheme: ScheduleTextButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: ScheduleTextFormFieldTheme.darkTextFormFieldTheme,
  );
}