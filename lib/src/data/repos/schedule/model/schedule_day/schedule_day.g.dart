// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDayImpl _$$ScheduleDayImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDayImpl(
      weekDay: json['weekDay'] as String,
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => ScheduleLesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleDayImplToJson(_$ScheduleDayImpl instance) =>
    <String, dynamic>{
      'weekDay': instance.weekDay,
      'lessons': instance.lessons,
    };
