// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyTaskImpl _$$DailyTaskImplFromJson(Map<String, dynamic> json) =>
    _$DailyTaskImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      id: json['id'] as String?,
      date: DateTime.parse(json['date'] as String),
      isCompleted: json['isCompleted'] ?? false,
    );

Map<String, dynamic> _$$DailyTaskImplToJson(_$DailyTaskImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
