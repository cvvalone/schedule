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
  String get weekDay => throw _privateConstructorUsedError;
  List<ScheduleLesson> get lessons => throw _privateConstructorUsedError;

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
  $Res call({String weekDay, List<ScheduleLesson> lessons});
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
    Object? weekDay = null,
    Object? lessons = null,
  }) {
    return _then(_value.copyWith(
      weekDay: null == weekDay
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as String,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<ScheduleLesson>,
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
  $Res call({String weekDay, List<ScheduleLesson> lessons});
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
    Object? weekDay = null,
    Object? lessons = null,
  }) {
    return _then(_$ScheduleDayImpl(
      weekDay: null == weekDay
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as String,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<ScheduleLesson>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleDayImpl implements _ScheduleDay {
  const _$ScheduleDayImpl(
      {required this.weekDay, required final List<ScheduleLesson> lessons})
      : _lessons = lessons;

  factory _$ScheduleDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDayImplFromJson(json);

  @override
  final String weekDay;
  final List<ScheduleLesson> _lessons;
  @override
  List<ScheduleLesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'ScheduleDay(weekDay: $weekDay, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDayImpl &&
            (identical(other.weekDay, weekDay) || other.weekDay == weekDay) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, weekDay, const DeepCollectionEquality().hash(_lessons));

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
      {required final String weekDay,
      required final List<ScheduleLesson> lessons}) = _$ScheduleDayImpl;

  factory _ScheduleDay.fromJson(Map<String, dynamic> json) =
      _$ScheduleDayImpl.fromJson;

  @override
  String get weekDay;
  @override
  List<ScheduleLesson> get lessons;

  /// Create a copy of ScheduleDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDayImplCopyWith<_$ScheduleDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
