// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleLesson _$ScheduleLessonFromJson(Map<String, dynamic> json) {
  return _ScheduleLesson.fromJson(json);
}

/// @nodoc
mixin _$ScheduleLesson {
  String get audithory => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String get teacher => throw _privateConstructorUsedError;
  String get timeStart => throw _privateConstructorUsedError;
  String get timeEnd => throw _privateConstructorUsedError;

  /// Serializes this ScheduleLesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleLessonCopyWith<ScheduleLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleLessonCopyWith<$Res> {
  factory $ScheduleLessonCopyWith(
          ScheduleLesson value, $Res Function(ScheduleLesson) then) =
      _$ScheduleLessonCopyWithImpl<$Res, ScheduleLesson>;
  @useResult
  $Res call(
      {String audithory,
      String subject,
      String? id,
      String teacher,
      String timeStart,
      String timeEnd});
}

/// @nodoc
class _$ScheduleLessonCopyWithImpl<$Res, $Val extends ScheduleLesson>
    implements $ScheduleLessonCopyWith<$Res> {
  _$ScheduleLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audithory = null,
    Object? subject = null,
    Object? id = freezed,
    Object? teacher = null,
    Object? timeStart = null,
    Object? timeEnd = null,
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
      timeStart: null == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String,
      timeEnd: null == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleLessonImplCopyWith<$Res>
    implements $ScheduleLessonCopyWith<$Res> {
  factory _$$ScheduleLessonImplCopyWith(_$ScheduleLessonImpl value,
          $Res Function(_$ScheduleLessonImpl) then) =
      __$$ScheduleLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String audithory,
      String subject,
      String? id,
      String teacher,
      String timeStart,
      String timeEnd});
}

/// @nodoc
class __$$ScheduleLessonImplCopyWithImpl<$Res>
    extends _$ScheduleLessonCopyWithImpl<$Res, _$ScheduleLessonImpl>
    implements _$$ScheduleLessonImplCopyWith<$Res> {
  __$$ScheduleLessonImplCopyWithImpl(
      _$ScheduleLessonImpl _value, $Res Function(_$ScheduleLessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audithory = null,
    Object? subject = null,
    Object? id = freezed,
    Object? teacher = null,
    Object? timeStart = null,
    Object? timeEnd = null,
  }) {
    return _then(_$ScheduleLessonImpl(
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
      timeStart: null == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String,
      timeEnd: null == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleLessonImpl implements _ScheduleLesson {
  const _$ScheduleLessonImpl(
      {required this.audithory,
      required this.subject,
      this.id,
      required this.teacher,
      required this.timeStart,
      required this.timeEnd});

  factory _$ScheduleLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleLessonImplFromJson(json);

  @override
  final String audithory;
  @override
  final String subject;
  @override
  final String? id;
  @override
  final String teacher;
  @override
  final String timeStart;
  @override
  final String timeEnd;

  @override
  String toString() {
    return 'ScheduleLesson(audithory: $audithory, subject: $subject, id: $id, teacher: $teacher, timeStart: $timeStart, timeEnd: $timeEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleLessonImpl &&
            (identical(other.audithory, audithory) ||
                other.audithory == audithory) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, audithory, subject, id, teacher, timeStart, timeEnd);

  /// Create a copy of ScheduleLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleLessonImplCopyWith<_$ScheduleLessonImpl> get copyWith =>
      __$$ScheduleLessonImplCopyWithImpl<_$ScheduleLessonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleLessonImplToJson(
      this,
    );
  }
}

abstract class _ScheduleLesson implements ScheduleLesson {
  const factory _ScheduleLesson(
      {required final String audithory,
      required final String subject,
      final String? id,
      required final String teacher,
      required final String timeStart,
      required final String timeEnd}) = _$ScheduleLessonImpl;

  factory _ScheduleLesson.fromJson(Map<String, dynamic> json) =
      _$ScheduleLessonImpl.fromJson;

  @override
  String get audithory;
  @override
  String get subject;
  @override
  String? get id;
  @override
  String get teacher;
  @override
  String get timeStart;
  @override
  String get timeEnd;

  /// Create a copy of ScheduleLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleLessonImplCopyWith<_$ScheduleLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
