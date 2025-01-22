import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/schedule/bloc/schedule_bloc.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/hours.dart';
import 'package:schedule/src/utils/constants/sizes.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class ScheduleMainScreen extends StatefulWidget {
  const ScheduleMainScreen({super.key});

  @override
  State<ScheduleMainScreen> createState() => _ScheduleMainScreenState();
}

class _ScheduleMainScreenState extends State<ScheduleMainScreen> {
  final daysGen = DateHelper.generateWeekdays(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Розклад'),
        ),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (!state.isIdle) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isIdle) {
              final schedule = state.schedule;
              return Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                      color: ScheduleColors.gTextColor.withValues(alpha: 0.6)),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(40),
                },
                children: [
                  // Заголовок із днями
                  TableRow(
                    children: [
                      const SizedBox(), // Порожня клітинка для заголовка годин
                      for (var day in daysGen) // 'days' - список назв днів
                        Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${day['day']}',
                                  style: TextStyle(
                                    fontSize: ScheduleSizes.fontSizeLg,
                                    fontWeight: FontWeight.w700,
                                    color: DateHelper.isToday(day['fullDate'])
                                        ? ScheduleColors.wTextColor
                                        : ScheduleColors.gTextColor
                                            .withValues(alpha: 0.6),
                                  ),
                                ),
                                Text(
                                  '${day['weekday']}',
                                  style: TextStyle(
                                    fontSize: ScheduleSizes.fontSizeLg,
                                    fontWeight: FontWeight.w400,
                                    color: DateHelper.isToday(day['fullDate'])
                                        ? ScheduleColors.wTextColor
                                        : ScheduleColors.gTextColor
                                            .withValues(alpha: 0.6),
                                  ),
                                )
                              ],
                            ),
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            color: DateHelper.isToday(day['fullDate'])
                                ? const Color(0xFF21283F)
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    ScheduleSizes.borderRadiusMd),
                                topRight: Radius.circular(
                                    ScheduleSizes.borderRadiusMd)),
                          ),
                        ),
                    ],
                  ),
                  // Рядки з годинами
                  for (var hour in ScheduleHours
                      .firstShiftHours) // 'hours' - список годин
                    TableRow(
                      children: [
                        Center(
                            child: Text(
                          hour,
                          style: TextStyle(fontSize: ScheduleSizes.fontSizeSm),
                        )), // Ліва колонка (час)
                        for (var day in daysGen) // Стовпці для кожного дня
                          Container(
                            height: 75,
                            color: DateHelper.isToday(day['fullDate'])
                                ? const Color(0xFF21283F)
                                : Colors.transparent,
                            child: Stack(
                              children: [
                                // ТУТ РОЗМІСТИТИ
                                for (var day in schedule.days)
                                  for (var lesson in day.lessons)
                                    if (lesson.timeStart == hour)
                                      Positioned(
                                        top: getLessonPosition(
                                            lesson.timeStart,
                                            lesson
                                                .timeEnd), // Початкова позиція
                                        height: getLessonPosition(
                                            lesson.timeStart,
                                            lesson.timeEnd), // Висота пари
                                        left: 5,
                                        right: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .blue, // Колір фону квадратика
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              lesson.subject,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                      ],
                    ),
                ],
              );
            } else {
              if (state.message != null) {
                return Center(
                  child: Text(state.message!),
                );
              }
            }
            return const SizedBox();
          },
        ));
  }

  double getLessonPosition(String timeStart, String timeEnd) {
    final start = _getHourFromTime(timeStart);
    final end = _getHourFromTime(timeEnd);
    return (end - start).toDouble() * 75; // 75 — висота одного рядка
  }

  double _getHourFromTime(String time) {
    final timeParts = time.split(':');
    return int.parse(timeParts[0]) + int.parse(timeParts[1]) / 60.0;
  }
}
