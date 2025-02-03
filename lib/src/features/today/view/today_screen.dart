import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_day/schedule_day.dart';
import 'package:schedule/src/features/schedule/bloc/schedule_bloc.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EventController _eventController = EventController();
    
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
      body: BlocConsumer<ScheduleBloc, ScheduleState>(
        listener: (context, state) {
          if (state.message != null && state.message!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
              duration: Duration(seconds: 2),
            ));
          }
        },
        builder: (context, state) {
          _eventController.removeWhere(
            (element) => true,
          );

          List<ScheduleDay> days = state.schedule.days;
          DateTime now = DateTime.now();
          for (var day in days) {
            for (var lesson in day.lessons) {
              List<int> startTime =
                  DateHelper.takePartsFromHour(lesson.timeStart);
              List<int> endTime = DateHelper.takePartsFromHour(lesson.timeEnd);
              _eventController.add(
                CalendarEventData(
                  title: lesson.subject,
                  date: DateTime(
                    now.year,
                    now.month,
                    DateHelper.getWeekDayDate(day.weekDay),
                  ),
                  startTime: DateTime(
                    now.year,
                    now.month,
                    DateHelper.getWeekDayDate(day.weekDay),
                    startTime[0],
                    startTime[1],
                  ),
                  endTime: DateTime(
                    now.year,
                    now.month,
                    DateHelper.getWeekDayDate(day.weekDay),
                    endTime[0],
                    endTime[1],
                  ),
                  description: 'Ауд: ${lesson.audithory}',
                  color: ScheduleColors.getRandomColor(),
                ),
              );
            }
          }
          if (state.isLoaded) {
            return Padding(
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
                    decoration:
                        BoxDecoration(color: ScheduleColors.headerBgColor)),
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
                      return InkWell(
                        onTap: () => _showEventDetails(context, event),
                        child: Container(
                          width: boundry.width - 5,
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
                              AutoSizeText(
                                event.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Gap(4),
                              Text(
                                event.description!,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _showEventDetails(BuildContext context, CalendarEventData event) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(event.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Дата: ${DateHelper.formatDate(event.date)}'),
              Text(
                  'Час: ${event.startTime!.hour}:${event.startTime!.minute == 0 ? '00' : event.startTime!.minute} - ${event.endTime!.hour}:${event.endTime!.minute == 0 ? '00' : event.endTime!.minute}'),
              Text('${event.description ?? "Не вказано"}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Закрити',
                style: TextStyle(
                  color: ScheduleColors.bActColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
