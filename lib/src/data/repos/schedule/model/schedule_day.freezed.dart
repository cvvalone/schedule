// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleDay _$ScheduleDayFromJson(Map<String, dynamic> json) {
  return _ScheduleDay.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDay {
  String get audithory => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String get teacher => throw _privateConstructorUsedError;
  String get time_start => throw _privateConstructorUsedError;
  String get time_end => throw _privateConstructorUsedError;

  /// Serializes this ScheduleDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleDayCopyWith<ScheduleDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDayCopyWith<$Res> {
  factory $ScheduleDayCopyWith(
          ScheduleDay value, $Res Function(ScheduleDay) then) =
      _$ScheduleDayCopyWithImpl<$Res, ScheduleDay>;
  @useResult
  $Res call(
      {String audithory,
      String subject,
      String? id,
      String teacher,
      String time_start,
      String time_end});
}

/// @nodoc
class _$ScheduleDayCopyWithImpl<$Res, $Val extends ScheduleDay>
    implements $ScheduleDayCopyWith<$Res> {
  _$ScheduleDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audithory = null,
    Object? subject = null,
    Object? id = freezed,
    Object? teacher = null,
    Object? time_start = null,
    Object? time_end = null,
  }) {
    return _then(_value.copyWith(
      audithory: null == audithory
          ? _value.audithory
          : audithory // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      time_start: null == time_start
          ? _value.time_start
          : time_start // ignore: cast_nullable_to_non_nullable
              as String,
      time_end: null == time_end
          ? _value.time_end
          : time_end // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleDayImplCopyWith<$Res>
    implements $ScheduleDayCopyWith<$Res> {
  factory _$$ScheduleDayImplCopyWith(
          _$ScheduleDayImpl value, $Res Function(_$ScheduleDayImpl) then) =
      __$$ScheduleDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String audithory,
      String subject,
      String? id,
      String teacher,
      String time_start,
      String time_end});
}

/// @nodoc
class __$$ScheduleDayImplCopyWithImpl<$Res>
    extends _$ScheduleDayCopyWithImpl<$Res, _$ScheduleDayImpl>
    implements _$$ScheduleDayImplCopyWith<$Res> {
  __$$ScheduleDayImplCopyWithImpl(
      _$ScheduleDayImpl _value, $Res Function(_$ScheduleDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audithory = null,
    Object? subject = null,
    Object? id = freezed,
    Object? teacher = null,
    Object? time_start = null,
    Object? time_end = null,
  }) {
    return _then(_$ScheduleDayImpl(
      audithory: null == audithory
          ? _value.audithory
          : audithory // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      time_start: null == time_start
          ? _value.time_start
          : time_start // ignore: cast_nullable_to_non_nullable
              as String,
      time_end: null == time_end
          ? _value.time_end
          : time_end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleDayImpl implements _ScheduleDay {
  const _$ScheduleDayImpl(
      {required this.audithory,
      required this.subject,
      this.id,
      required this.teacher,
      required this.time_start,
      required this.time_end});

  factory _$ScheduleDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDayImplFromJson(json);

  @override
  final String audithory;
  @override
  final String subject;
  @override
  final String? id;
  @override
  final String teacher;
  @override
  final String time_start;
  @override
  final String time_end;

  @override
  String toString() {
    return 'ScheduleDay(audithory: $audithory, subject: $subject, id: $id, teacher: $teacher, time_start: $time_start, time_end: $time_end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDayImpl &&
            (identical(other.audithory, audithory) ||
                other.audithory == audithory) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.time_start, time_start) ||
                other.time_start == time_start) &&
            (identical(other.time_end, time_end) ||
                other.time_end == time_end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, audithory, subject, id, teacher, time_start, time_end);

  /// Create a copy of ScheduleDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDayImplCopyWith<_$ScheduleDayImpl> get copyWith =>
      __$$ScheduleDayImplCopyWithImpl<_$ScheduleDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDayImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDay implements ScheduleDay {
  const factory _ScheduleDay(
      {required final String audithory,
      required final String subject,
      final String? id,
      required final String teacher,
      required final String time_start,
      required final String time_end}) = _$ScheduleDayImpl;

  factory _ScheduleDay.fromJson(Map<String, dynamic> json) =
      _$ScheduleDayImpl.fromJson;

  @override
  String get audithory;
  @override
  String get subject;
  @override
  String? get id;
  @override
  String get teacher;
  @override
  String get time_start;
  @override
  String get time_end;

  /// Create a copy of ScheduleDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDayImplCopyWith<_$ScheduleDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
