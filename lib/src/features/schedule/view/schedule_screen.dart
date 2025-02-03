import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_day/schedule_day.dart';
import 'package:schedule/src/features/schedule/bloc/schedule_bloc.dart';
import 'package:schedule/src/features/schedule/view/schedule_card.dart';
import 'package:schedule/src/utils/constants/colors.dart';
import 'package:schedule/src/utils/constants/sizes.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

class ScheduleMainScreen extends StatefulWidget {
  ScheduleMainScreen({super.key});

  @override
  State<ScheduleMainScreen> createState() => _ScheduleMainScreenState();
}

class _ScheduleMainScreenState extends State<ScheduleMainScreen> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    today = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - 36;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Розклад на день'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Container(
            height: 2,
            color: ScheduleColors.greyColor,
            width: calcWidth,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () => _pickDay(context),
              child: Text(
                'Вибрати день',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  color: ScheduleColors.bLTextColor,
                ),
              ),
            ),
          )
        ],
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
          if (!state.isLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isLoaded) {
            List<ScheduleDay> days = state.schedule.days;
            ScheduleDay day = days.firstWhere(
              orElse: () => ScheduleDay(
                weekDay: DateHelper.getWeekDayName(today.weekday),
                lessons: [],
              ),
              (element) =>
                  element.weekDay == DateHelper.getWeekDayName(today.weekday),
            );
            if (day.lessons.length == 0)
              return Center(
                child: Text(
                  'На цей день немає даних.',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              );
            else
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: ScheduleSizes.spaceBetweenItems),
                  itemCount: day.lessons.length,
                  itemBuilder: (context, index) {
                    final item = day.lessons[index];
                    return Column(
                      children: [
                        ScheduleCard(
                          room: item.audithory,
                          timeStart: item.timeStart,
                          timeEnd: item.timeEnd,
                          subject: item.subject,
                          teacher: item.teacher,
                          index: index,
                        ),
                        Divider(
                          color: ScheduleColors.lightGreyColor,
                          thickness: 2,
                          height: 2,
                        ),
                      ],
                    );
                  },
                ),
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
      ),
    );
  }

  Future<void> _pickDay(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 5),
    );

    if (pickedDate != null && pickedDate != today) {
      setState(() {
        today = pickedDate;
      });
    }
  }
}
