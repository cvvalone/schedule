import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class ScheduleCheckBoxTheme {
  ScheduleCheckBoxTheme._();

  static final lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    checkColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return ScheduleColors.sBgColor;
        } else {
          return ScheduleColors.wBTextColor;
        }
      },
    ),
    side: BorderSide(
      color: ScheduleColors.glSucColor,
      width: 2,
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return ScheduleColors.wTextColor;
        } else {
          return Colors.transparent;
        }
      },
    ),
  );

  static final darkCheckBoxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      checkColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          } else {
            return Colors.white;
          }
        },
      ),
      side: BorderSide(color: ScheduleColors.glSucColor),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.orange[300];
        } else {
          return Colors.transparent;
        }
      }));
}
