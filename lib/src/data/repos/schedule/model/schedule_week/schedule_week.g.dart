// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleWeekImpl _$$ScheduleWeekImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleWeekImpl(
      isEvenWeek: json['isEvenWeek'] as bool? ?? false,
      days: (json['days'] as List<dynamic>)
          .map((e) => ScheduleDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleWeekImplToJson(_$ScheduleWeekImpl instance) =>
    <String, dynamic>{
      'isEvenWeek': instance.isEvenWeek,
      'days': instance.days,
    };
