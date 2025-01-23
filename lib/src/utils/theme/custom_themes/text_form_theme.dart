import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class ScheduleTextFormFieldTheme {
  ScheduleTextFormFieldTheme._();

static final lightTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ScheduleColors.wBTextColor,
    suffixIconColor: ScheduleColors.wBTextColor,
    // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: ScheduleColors.gTextColor),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: WidgetStateColor.resolveWith((states){
          if (states.contains(WidgetState.focused)) {
            return ScheduleColors.wTextColor;
          }else{
            return ScheduleColors.gTextColor;
          }
        }) 
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: ScheduleColors.gTextColor),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.grey, ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: ScheduleColors.wBTextColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 2, color: ScheduleColors.rErrColor),
    ),
  );


  static final darkTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ScheduleColors.wBTextColor,
    suffixIconColor: ScheduleColors.wBTextColor,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: ScheduleColors.gTextColor),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: WidgetStateColor.resolveWith((states){
          if (states.contains(WidgetState.focused)) {
            return ScheduleColors.wTextColor;
          }else{
            return ScheduleColors.gTextColor;
          }
        }) 
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: ScheduleColors.gTextColor),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
