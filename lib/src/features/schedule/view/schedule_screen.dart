import 'package:flutter/material.dart';
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
  final days = DateHelper.generateWeekdays(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Розклад'),
      ),
      body: Table(
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
              for (var day in days) // 'days' - список назв днів
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
                        topLeft: Radius.circular(ScheduleSizes.borderRadiusMd),
                        topRight:
                            Radius.circular(ScheduleSizes.borderRadiusMd)),
                  ),
                ),
            ],
          ),
          // Рядки з годинами
          for (var hour
              in ScheduleHours.firstShiftHours) // 'hours' - список годин
            TableRow(
              children: [
                Center(
                    child: Text(
                  hour,
                  style: TextStyle(
                    fontSize: ScheduleSizes.fontSizeSm
                  ),
                )), // Ліва колонка (час)
                for (var day in days) // Стовпці для кожного дня
                  Container(
                    height: 75,
                    color: DateHelper.isToday(day['fullDate'])
                        ? const Color(0xFF21283F)
                        : Colors.transparent,
                    child: Stack(
                      children: [],
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
