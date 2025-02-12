import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_week/schedule_week.dart';
import 'package:schedule/src/data/repos/schedule/schedule_repository.dart';
import 'package:schedule/src/utils/formatters/date_helper.dart';

part 'schedule_state.dart';
part 'schedule_event.dart';
part 'schedule_bloc.freezed.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final _repository = GetIt.I<ScheduleRepository>();
  ScheduleBloc({required repository})
      : super(ScheduleState.idle(schedule: ScheduleWeek(days: []))) {
    on<ScheduleEvent>((event, emit) async {
      await event.map(loadSchedule: (e) async {
        emit(ScheduleState.processing(schedule: state.schedule));
        try {
          ScheduleWeek updatedSchedule = await _repository
              .getSchedule(DateHelper.isEvenWeek(DateTime.now()));
          emit(ScheduleState.idle(schedule: updatedSchedule));
        } catch (e) {
          debugPrint('${e.toString()}');
          emit(ScheduleState.idle(
              schedule: state.schedule, message: '${e.toString()}'));
        }
      });
    });
  }
}
