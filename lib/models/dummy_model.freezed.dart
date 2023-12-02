// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DummyModel {
  String get title => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DummyModelCopyWith<DummyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyModelCopyWith<$Res> {
  factory $DummyModelCopyWith(
          DummyModel value, $Res Function(DummyModel) then) =
      _$DummyModelCopyWithImpl<$Res, DummyModel>;
  @useResult
  $Res call({String title, int number});
}

/// @nodoc
class _$DummyModelCopyWithImpl<$Res, $Val extends DummyModel>
    implements $DummyModelCopyWith<$Res> {
  _$DummyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DummyModelImplCopyWith<$Res>
    implements $DummyModelCopyWith<$Res> {
  factory _$$DummyModelImplCopyWith(
          _$DummyModelImpl value, $Res Function(_$DummyModelImpl) then) =
      __$$DummyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int number});
}

/// @nodoc
class __$$DummyModelImplCopyWithImpl<$Res>
    extends _$DummyModelCopyWithImpl<$Res, _$DummyModelImpl>
    implements _$$DummyModelImplCopyWith<$Res> {
  __$$DummyModelImplCopyWithImpl(
      _$DummyModelImpl _value, $Res Function(_$DummyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? number = null,
  }) {
    return _then(_$DummyModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DummyModelImpl with DiagnosticableTreeMixin implements _DummyModel {
  const _$DummyModelImpl({this.title = '', this.number = 1});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int number;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DummyModel(title: $title, number: $number)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DummyModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('number', number));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DummyModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DummyModelImplCopyWith<_$DummyModelImpl> get copyWith =>
      __$$DummyModelImplCopyWithImpl<_$DummyModelImpl>(this, _$identity);
}

abstract class _DummyModel implements DummyModel {
  const factory _DummyModel({final String title, final int number}) =
      _$DummyModelImpl;

  @override
  String get title;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$DummyModelImplCopyWith<_$DummyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
