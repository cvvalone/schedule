// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDayImpl _$$ScheduleDayImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDayImpl(
      audithory: json['audithory'] as String,
      subject: json['subject'] as String,
      id: json['id'] as String?,
      teacher: json['teacher'] as String,
      time_start: json['time_start'] as String,
      time_end: json['time_end'] as String,
    );

Map<String, dynamic> _$$ScheduleDayImplToJson(_$ScheduleDayImpl instance) =>
    <String, dynamic>{
      'audithory': instance.audithory,
      'subject': instance.subject,
      'id': instance.id,
      'teacher': instance.teacher,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
    };
