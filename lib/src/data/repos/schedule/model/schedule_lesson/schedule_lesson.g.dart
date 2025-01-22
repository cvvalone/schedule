// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleLessonImpl _$$ScheduleLessonImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleLessonImpl(
      audithory: json['audithory'] as String,
      subject: json['subject'] as String,
      id: json['id'] as String?,
      teacher: json['teacher'] as String,
      timeStart: json['timeStart'] as String,
      timeEnd: json['timeEnd'] as String,
    );

Map<String, dynamic> _$$ScheduleLessonImplToJson(
        _$ScheduleLessonImpl instance) =>
    <String, dynamic>{
      'audithory': instance.audithory,
      'subject': instance.subject,
      'id': instance.id,
      'teacher': instance.teacher,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
    };
