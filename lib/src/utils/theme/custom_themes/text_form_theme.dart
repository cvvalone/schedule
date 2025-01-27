import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class ScheduleTextFormFieldTheme {
  ScheduleTextFormFieldTheme._();

  static final lightTextFormFieldTheme = InputDecorationTheme(
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    errorMaxLines: 3,
    prefixIconColor: ScheduleColors.wBTextColor,
    suffixIconColor: ScheduleColors.wBTextColor,
    fillColor: ScheduleColors.bActColor,
    // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: ScheduleColors.gTextColor,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return ScheduleColors.wTextColor;
          } else {
            return ScheduleColors.gTextColor;
          }
        })),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ScheduleColors.gTextColor),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
        borderSide: BorderSide.none),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
        borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
        borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
        borderSide: BorderSide.none),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScheduleSizes.borderRadiusMd),
        borderSide: BorderSide.none),
  );

  static final darkTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ScheduleColors.wBTextColor,
    suffixIconColor: ScheduleColors.wBTextColor,
    fillColor: ScheduleColors.bActColor,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: ScheduleColors.gTextColor,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return ScheduleColors.wTextColor;
          } else {
            return ScheduleColors.gTextColor;
          }
        })),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ScheduleColors.gTextColor),
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );
}
