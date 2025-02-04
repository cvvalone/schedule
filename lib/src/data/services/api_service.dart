import 'package:dio/dio.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_week/schedule_week.dart';

abstract class ApiService {
  Future<ScheduleWeek> getSchedule();
  Future<ScheduleWeek> getNotEvenSchedule();
}

class MockApiService implements ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://679b8d6833d3168463244731.mockapi.io/'),
  );

  @override
  Future<ScheduleWeek> getSchedule() async {
    try {
      final response = await _dio.get('/schedule');
      if (response.statusCode == 200) {
        return ScheduleWeek.fromJson(response.data.first);
      }
      throw Exception(
          'Code: ${response.statusCode}, Message: ${response.statusMessage}');
    } catch (e) {
      throw Exception(
          'Сталась помилка при отриманні розкладу: ${e.toString()}');
    }
  }

  @override
  Future<ScheduleWeek> getNotEvenSchedule() async {
    try {
      final response = await _dio.get('/scheduleNEven');
      if (response.statusCode == 200) {
        return ScheduleWeek.fromJson(response.data);
      }
      throw Exception(
          'Code: ${response.statusCode}, Message: ${response.statusMessage}');
    } catch (e) {
      throw Exception(
          'Сталась помилка при отриманні розкладу: ${e.toString()}');
    }
  }
}
