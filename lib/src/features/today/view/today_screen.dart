import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final EventController _eventController = EventController();

  @override
  void initState() {
    _eventController.add(
      CalendarEventData(
        title: 'ПІ',
        date: DateTime(2025, 1, 29, 10, 0),
        startTime: DateTime(2025, 1, 29, 9, 40),
        endTime: DateTime(2025, 1, 29, 10, 40),
        description: 'Ауд: 102',
        color: Colors.blue,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Розклад на тиждень'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(
              height: 2,
              color: ScheduleColors.greyColor,
              width: calcWidth,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: WeekView(
          controller: _eventController,
          headerStringBuilder: (date, {secondaryDate}) =>
              '${date.day}/${date.month}/${date.year} по ${secondaryDate!.day}/${secondaryDate.month}/${secondaryDate.year}',
          headerStyle: HeaderStyle(
              headerTextStyle: TextStyle(
                color: ScheduleColors.sBgColor,
                fontSize: 15,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(color: ScheduleColors.headerBgColor)),
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
          endHour: 20,
          timeLineWidth: 40,
          minuteSlotSize: MinuteSlotSize.minutes60,
          // timeLineOffset: 90,
          heightPerMinute: 1.5,
          timeLineBuilder: (hour) {
            return Text(
              '${hour.hour < 10 ? 0 : ''}${hour.hour}:00',
              style: TextStyle(
                color: ScheduleColors.sBgColor,
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            );
          },
          eventTileBuilder: (date, events, boundry, start, end) {
            return Column(
              children: events.map((event) {
                return Container(
                  width: boundry.width,
                  height: boundry.height,
                  decoration: BoxDecoration(
                    color: event.color,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        event.description!,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
