// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyTask _$DailyTaskFromJson(Map<String, dynamic> json) {
  return _DailyTask.fromJson(json);
}

/// @nodoc
mixin _$DailyTask {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  dynamic get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this DailyTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTaskCopyWith<DailyTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTaskCopyWith<$Res> {
  factory $DailyTaskCopyWith(DailyTask value, $Res Function(DailyTask) then) =
      _$DailyTaskCopyWithImpl<$Res, DailyTask>;
  @useResult
  $Res call(
      {String title,
      String description,
      String? id,
      DateTime date,
      dynamic isCompleted});
}

/// @nodoc
class _$DailyTaskCopyWithImpl<$Res, $Val extends DailyTask>
    implements $DailyTaskCopyWith<$Res> {
  _$DailyTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? id = freezed,
    Object? date = null,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTaskImplCopyWith<$Res>
    implements $DailyTaskCopyWith<$Res> {
  factory _$$DailyTaskImplCopyWith(
          _$DailyTaskImpl value, $Res Function(_$DailyTaskImpl) then) =
      __$$DailyTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String? id,
      DateTime date,
      dynamic isCompleted});
}

/// @nodoc
class __$$DailyTaskImplCopyWithImpl<$Res>
    extends _$DailyTaskCopyWithImpl<$Res, _$DailyTaskImpl>
    implements _$$DailyTaskImplCopyWith<$Res> {
  __$$DailyTaskImplCopyWithImpl(
      _$DailyTaskImpl _value, $Res Function(_$DailyTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? id = freezed,
    Object? date = null,
    Object? isCompleted = freezed,
  }) {
    return _then(_$DailyTaskImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: freezed == isCompleted ? _value.isCompleted! : isCompleted,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTaskImpl implements _DailyTask {
  const _$DailyTaskImpl(
      {required this.title,
      required this.description,
      this.id,
      required this.date,
      this.isCompleted = false});

  factory _$DailyTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTaskImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String? id;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final dynamic isCompleted;

  @override
  String toString() {
    return 'DailyTask(title: $title, description: $description, id: $id, date: $date, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTaskImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, id, date,
      const DeepCollectionEquality().hash(isCompleted));

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTaskImplCopyWith<_$DailyTaskImpl> get copyWith =>
      __$$DailyTaskImplCopyWithImpl<_$DailyTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTaskImplToJson(
      this,
    );
  }
}

abstract class _DailyTask implements DailyTask {
  const factory _DailyTask(
      {required final String title,
      required final String description,
      final String? id,
      required final DateTime date,
      final dynamic isCompleted}) = _$DailyTaskImpl;

  factory _DailyTask.fromJson(Map<String, dynamic> json) =
      _$DailyTaskImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String? get id;
  @override
  DateTime get date;
  @override
  dynamic get isCompleted;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTaskImplCopyWith<_$DailyTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
