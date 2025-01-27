import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/sizes.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          DateHelper.formatDate(DateTime.now()),
          style: TextStyle(fontSize: ScheduleSizes.fontSizeLg),
        ),
      ),
      body: WeekView(
        controller: EventController(),
        headerStringBuilder: (date, {secondaryDate}) => '${date.day}/${date.month}/${date.year} по ${secondaryDate!.day}/${secondaryDate.month}/${secondaryDate.year}',
        headerStyle: HeaderStyle(
          headerTextStyle: TextStyle(
            color: ScheduleColors.sBgColor,
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            color: ScheduleColors.headerBgColor
            
          )
        ),
        weekDayBuilder: (date) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                    color: ScheduleColors.bActColor,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DateHelper.getWeekDayName(date.weekday),
                  style: TextStyle(
                    color: ScheduleColors.bActColor,
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          );
        },
        startHour: 7,
        timeLineWidth: 40,
        timeLineBuilder: (hour) {
          return Center(
            child: Text(
              '${hour.hour < 10 ? 0 : ''}${hour.hour}:00',
              style: TextStyle(
                color: ScheduleColors.sBgColor,
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        },

      ),
    );
  }

  
}
