import 'package:flutter/material.dart';

class ScheduleChipTheme{
  ScheduleChipTheme._();

  static final lightChipTheme = ChipThemeData(
    disabledColor: Colors.transparent,
    labelStyle: TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
  
  
  static final darkChipTheme = ChipThemeData(
    disabledColor: Colors.transparent,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
  

}