// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleWeek _$ScheduleWeekFromJson(Map<String, dynamic> json) {
  return _ScheduleWeek.fromJson(json);
}

/// @nodoc
mixin _$ScheduleWeek {
  bool get isEvenWeek => throw _privateConstructorUsedError;
  List<ScheduleDay> get days => throw _privateConstructorUsedError;

  /// Serializes this ScheduleWeek to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleWeekCopyWith<ScheduleWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleWeekCopyWith<$Res> {
  factory $ScheduleWeekCopyWith(
          ScheduleWeek value, $Res Function(ScheduleWeek) then) =
      _$ScheduleWeekCopyWithImpl<$Res, ScheduleWeek>;
  @useResult
  $Res call({bool isEvenWeek, List<ScheduleDay> days});
}

/// @nodoc
class _$ScheduleWeekCopyWithImpl<$Res, $Val extends ScheduleWeek>
    implements $ScheduleWeekCopyWith<$Res> {
  _$ScheduleWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEvenWeek = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      isEvenWeek: null == isEvenWeek
          ? _value.isEvenWeek
          : isEvenWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleWeekImplCopyWith<$Res>
    implements $ScheduleWeekCopyWith<$Res> {
  factory _$$ScheduleWeekImplCopyWith(
          _$ScheduleWeekImpl value, $Res Function(_$ScheduleWeekImpl) then) =
      __$$ScheduleWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEvenWeek, List<ScheduleDay> days});
}

/// @nodoc
class __$$ScheduleWeekImplCopyWithImpl<$Res>
    extends _$ScheduleWeekCopyWithImpl<$Res, _$ScheduleWeekImpl>
    implements _$$ScheduleWeekImplCopyWith<$Res> {
  __$$ScheduleWeekImplCopyWithImpl(
      _$ScheduleWeekImpl _value, $Res Function(_$ScheduleWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEvenWeek = null,
    Object? days = null,
  }) {
    return _then(_$ScheduleWeekImpl(
      isEvenWeek: null == isEvenWeek
          ? _value.isEvenWeek
          : isEvenWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleWeekImpl implements _ScheduleWeek {
  const _$ScheduleWeekImpl(
      {this.isEvenWeek = false, required final List<ScheduleDay> days})
      : _days = days;

  factory _$ScheduleWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleWeekImplFromJson(json);

  @override
  @JsonKey()
  final bool isEvenWeek;
  final List<ScheduleDay> _days;
  @override
  List<ScheduleDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'ScheduleWeek(isEvenWeek: $isEvenWeek, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleWeekImpl &&
            (identical(other.isEvenWeek, isEvenWeek) ||
                other.isEvenWeek == isEvenWeek) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isEvenWeek, const DeepCollectionEquality().hash(_days));

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleWeekImplCopyWith<_$ScheduleWeekImpl> get copyWith =>
      __$$ScheduleWeekImplCopyWithImpl<_$ScheduleWeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleWeekImplToJson(
      this,
    );
  }
}

abstract class _ScheduleWeek implements ScheduleWeek {
  const factory _ScheduleWeek(
      {final bool isEvenWeek,
      required final List<ScheduleDay> days}) = _$ScheduleWeekImpl;

  factory _ScheduleWeek.fromJson(Map<String, dynamic> json) =
      _$ScheduleWeekImpl.fromJson;

  @override
  bool get isEvenWeek;
  @override
  List<ScheduleDay> get days;

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleWeekImplCopyWith<_$ScheduleWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
