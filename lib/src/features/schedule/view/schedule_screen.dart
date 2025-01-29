import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/src/features/schedule/bloc/schedule_bloc.dart';
import 'package:schedule/src/features/schedule/view/schedule_card.dart';
import 'package:schedule/src/utils/constants/colors.dart';
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
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
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
            if (!state.isLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isLoaded) {
              final schedule = state.schedule;
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: ScheduleSizes.spaceBetweenItems),
                itemCount: schedule.days[0].lessons.length,
                itemBuilder: (context, index) {
                  final item = schedule.days[0].lessons[index];
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
                      Divider(color: ScheduleColors.lightGreyColor, thickness: 2, height: 2,)
                    ],
                  );
                },
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
}
