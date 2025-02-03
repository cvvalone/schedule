import 'package:get_it/get_it.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_day/schedule_day.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_lesson/schedule_lesson.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_week/schedule_week.dart';
import 'package:schedule/src/data/services/api_service.dart';

abstract class ScheduleRepository {
  Future<ScheduleWeek> getSchedule(bool isEven);
}

class MockScheduleRepository implements ScheduleRepository {
  final _apiServise = GetIt.I<ApiService>();

  // final ScheduleWeek schedule = ScheduleWeek(
  //   isEvenWeek: true, // чи парний тиждень
  //   days: [
  //     ScheduleDay(
  //       weekDay: "Пн",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Математика",
  //           teacher: "Іваненко І.І.",
  //           timeStart: "09:40",
  //           timeEnd: "10:40",
  //           audithory: "101",
  //         ),
  //         ScheduleLesson(
  //           subject: "Фізика",
  //           teacher: "Петров П.П.",
  //           timeStart: "12:10",
  //           timeEnd: "13:10",
  //           audithory: "102",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Вт",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Хімія",
  //           teacher: "Сидоренко С.С.",
  //           timeStart: "12:00",
  //           timeEnd: "12:10",
  //           audithory: "201",
  //         ),
  //         ScheduleLesson(
  //           subject: "Інформатика",
  //           teacher: "Коваленко К.К.",
  //           timeStart: "09:40",
  //           timeEnd: "10:40",
  //           audithory: "202",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Ср",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Англійська мова",
  //           teacher: "Бондаренко Б.Б.",
  //           timeStart: "08:00",
  //           timeEnd: "09:40",
  //           audithory: "301",
  //         ),
  //         ScheduleLesson(
  //           subject: "Біологія",
  //           teacher: "Гончаренко Г.Г.",
  //           timeStart: "11:00",
  //           timeEnd: "12:00",
  //           audithory: "302",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Чт",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Географія",
  //           teacher: "Дмитренко Д.Д.",
  //           timeStart: "09:40",
  //           timeEnd: "10:40",
  //           audithory: "401",
  //         ),
  //         ScheduleLesson(
  //           subject: "Література",
  //           teacher: "Захаренко З.З.",
  //           timeStart: "12:10",
  //           timeEnd: "13:10",
  //           audithory: "402",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Пт",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Історія",
  //           teacher: "Євтушенко Є.Є.",
  //           timeStart: "08:30",
  //           timeEnd: "09:30",
  //           audithory: "501",
  //         ),
  //         ScheduleLesson(
  //           subject: "Філософія",
  //           teacher: "Журавель Ж.Ж.",
  //           timeStart: '11:00',
  //           timeEnd: '12:00',
  //           audithory: "502",
  //         ),
  //       ],
  //     ),
  //   ],
  // );

  // final ScheduleWeek scheduleNotEven = ScheduleWeek(
  //   isEvenWeek: false, // чи парний тиждень
  //   days: [
  //     ScheduleDay(
  //       weekDay: "Пн",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Алгебра",
  //           teacher: "Іваненко І.І.",
  //           timeStart: "08:30",
  //           timeEnd: "09:30",
  //           audithory: "101",
  //         ),
  //         ScheduleLesson(
  //           subject: "Геометрія",
  //           teacher: "Петров П.П.",
  //           timeStart: "10:40",
  //           timeEnd: "11:40",
  //           audithory: "102",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Вт",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Фізика",
  //           teacher: "Сидоренко С.С.",
  //           timeStart: "09:40",
  //           timeEnd: "10:40",
  //           audithory: "201",
  //         ),
  //         ScheduleLesson(
  //           subject: "Хімія",
  //           teacher: "Коваленко К.К.",
  //           timeStart: "12:00",
  //           timeEnd: "13:00",
  //           audithory: "202",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Ср",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Інформатика",
  //           teacher: "Бондаренко Б.Б.",
  //           timeStart: "09:00",
  //           timeEnd: "10:00",
  //           audithory: "301",
  //         ),
  //         ScheduleLesson(
  //           subject: "Біологія",
  //           teacher: "Гончаренко Г.Г.",
  //           timeStart: "11:40",
  //           timeEnd: "12:40",
  //           audithory: "302",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Чт",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Англійська мова",
  //           teacher: "Дмитренко Д.Д.",
  //           timeStart: "08:30",
  //           timeEnd: "09:30",
  //           audithory: "401",
  //         ),
  //         ScheduleLesson(
  //           subject: "Література",
  //           teacher: "Захаренко З.З.",
  //           timeStart: "11:00",
  //           timeEnd: "12:00",
  //           audithory: "402",
  //         ),
  //       ],
  //     ),
  //     ScheduleDay(
  //       weekDay: "Пт",
  //       lessons: [
  //         ScheduleLesson(
  //           subject: "Історія України",
  //           teacher: "Євтушенко Є.Є.",
  //           timeStart: "10:00",
  //           timeEnd: "11:00",
  //           audithory: "501",
  //         ),
  //         ScheduleLesson(
  //           subject: "Філософія",
  //           teacher: "Журавель Ж.Ж.",
  //           timeStart: "12:10",
  //           timeEnd: "13:10",
  //           audithory: "502",
  //         ),
  //       ],
  //     ),
  //   ],
  // );

  @override
  Future<ScheduleWeek> getSchedule(bool isEven) async {
    if(isEven){
      final schedule = await _apiServise.getSchedule();
      return schedule;
    }else{
      final schedule = await _apiServise.getNotEvenSchedule();
      return schedule;
    }
  }
}

class ScheduleRepositoryImpl implements ScheduleRepository{
  @override
  Future<ScheduleWeek> getSchedule(bool isEven) {
    // TODO: зробити справжній репозиторій
    throw UnimplementedError();
  }

}
