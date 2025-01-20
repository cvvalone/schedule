// import 'package:bloc/bloc.dart';

// import 'schedule_event.dart';
// import 'schedule_state.dart';

// class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
//   ScheduleBloc() : super(ScheduleState()) {
//     on<InitEvent>(_init);
//   }

//   void _init(InitEvent event, Emitter<ScheduleState> emit) async {
//     emit(state.clone());
//   }
// }