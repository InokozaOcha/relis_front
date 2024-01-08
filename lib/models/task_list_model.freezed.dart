// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskListModel {
  String get textTitle => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get startNumber => throw _privateConstructorUsedError;
  int get endNumber => throw _privateConstructorUsedError;
  List<ScheduledDate> get schedule => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskListModelCopyWith<TaskListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListModelCopyWith<$Res> {
  factory $TaskListModelCopyWith(
          TaskListModel value, $Res Function(TaskListModel) then) =
      _$TaskListModelCopyWithImpl<$Res, TaskListModel>;
  @useResult
  $Res call(
      {String textTitle,
      DateTime startDate,
      DateTime endDate,
      int startNumber,
      int endNumber,
      List<ScheduledDate> schedule});
}

/// @nodoc
class _$TaskListModelCopyWithImpl<$Res, $Val extends TaskListModel>
    implements $TaskListModelCopyWith<$Res> {
  _$TaskListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textTitle = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? startNumber = null,
    Object? endNumber = null,
    Object? schedule = null,
  }) {
    return _then(_value.copyWith(
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startNumber: null == startNumber
          ? _value.startNumber
          : startNumber // ignore: cast_nullable_to_non_nullable
              as int,
      endNumber: null == endNumber
          ? _value.endNumber
          : endNumber // ignore: cast_nullable_to_non_nullable
              as int,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduledDate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskListModelImplCopyWith<$Res>
    implements $TaskListModelCopyWith<$Res> {
  factory _$$TaskListModelImplCopyWith(
          _$TaskListModelImpl value, $Res Function(_$TaskListModelImpl) then) =
      __$$TaskListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String textTitle,
      DateTime startDate,
      DateTime endDate,
      int startNumber,
      int endNumber,
      List<ScheduledDate> schedule});
}

/// @nodoc
class __$$TaskListModelImplCopyWithImpl<$Res>
    extends _$TaskListModelCopyWithImpl<$Res, _$TaskListModelImpl>
    implements _$$TaskListModelImplCopyWith<$Res> {
  __$$TaskListModelImplCopyWithImpl(
      _$TaskListModelImpl _value, $Res Function(_$TaskListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textTitle = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? startNumber = null,
    Object? endNumber = null,
    Object? schedule = null,
  }) {
    return _then(_$TaskListModelImpl(
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startNumber: null == startNumber
          ? _value.startNumber
          : startNumber // ignore: cast_nullable_to_non_nullable
              as int,
      endNumber: null == endNumber
          ? _value.endNumber
          : endNumber // ignore: cast_nullable_to_non_nullable
              as int,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduledDate>,
    ));
  }
}

/// @nodoc

class _$TaskListModelImpl
    with DiagnosticableTreeMixin
    implements _TaskListModel {
  const _$TaskListModelImpl(
      {this.textTitle = '',
      required this.startDate,
      required this.endDate,
      this.startNumber = 1,
      this.endNumber = 1,
      final List<ScheduledDate> schedule = const []})
      : _schedule = schedule;

  @override
  @JsonKey()
  final String textTitle;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final int startNumber;
  @override
  @JsonKey()
  final int endNumber;
  final List<ScheduledDate> _schedule;
  @override
  @JsonKey()
  List<ScheduledDate> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskListModel(textTitle: $textTitle, startDate: $startDate, endDate: $endDate, startNumber: $startNumber, endNumber: $endNumber, schedule: $schedule)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskListModel'))
      ..add(DiagnosticsProperty('textTitle', textTitle))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('startNumber', startNumber))
      ..add(DiagnosticsProperty('endNumber', endNumber))
      ..add(DiagnosticsProperty('schedule', schedule));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListModelImpl &&
            (identical(other.textTitle, textTitle) ||
                other.textTitle == textTitle) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startNumber, startNumber) ||
                other.startNumber == startNumber) &&
            (identical(other.endNumber, endNumber) ||
                other.endNumber == endNumber) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textTitle, startDate, endDate,
      startNumber, endNumber, const DeepCollectionEquality().hash(_schedule));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListModelImplCopyWith<_$TaskListModelImpl> get copyWith =>
      __$$TaskListModelImplCopyWithImpl<_$TaskListModelImpl>(this, _$identity);
}

abstract class _TaskListModel implements TaskListModel {
  const factory _TaskListModel(
      {final String textTitle,
      required final DateTime startDate,
      required final DateTime endDate,
      final int startNumber,
      final int endNumber,
      final List<ScheduledDate> schedule}) = _$TaskListModelImpl;

  @override
  String get textTitle;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get startNumber;
  @override
  int get endNumber;
  @override
  List<ScheduledDate> get schedule;
  @override
  @JsonKey(ignore: true)
  _$$TaskListModelImplCopyWith<_$TaskListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
