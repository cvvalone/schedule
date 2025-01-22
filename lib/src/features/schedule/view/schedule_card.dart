import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/sizes.dart';

class ScheduleCard extends StatefulWidget {
  final String subject;
  final String timeStart;
  final String timeEnd;
  final String room;
  final String teacher;

  const ScheduleCard({
    required this.subject,
    required this.timeStart,
    required this.timeEnd,
    required this.room,
    required this.teacher,
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  // bool _isActive = false;

  // void toggleActive(){
  //   setState(() {
  //     _isActive = !_isActive;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ScheduleColors.tBgColor,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Час
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.timeStart,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ScheduleColors.gTextColor,
                  ),
                ),
                Text(
                  widget.timeEnd,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ScheduleColors.gTextColor,
                  ),
                ),
              ],
            ),
          ),
          // Вертикальний розділювач
          Container(
            height: 50,
            width: 1, // Товщина лінії
            color: ScheduleColors.gSucColor,
          ),
          // Текстова частина
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subject,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ScheduleColors.gSucColor,
                    ),
                  ),
                  const SizedBox(height: ScheduleSizes.spaceBetweenItems),
                  Row(
                    children: [
                      Text(
                        'Ауд. ${widget.room}',
                        style: TextStyle(
                          color: ScheduleColors.gTextColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        ' | ${widget.teacher}',
                        style: TextStyle(
                          color: ScheduleColors.gTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
