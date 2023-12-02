import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy_model.freezed.dart';

@freezed
class DummyModel with _$DummyModel {
  const factory DummyModel({
    @Default('') String title,
    @Default(1) int number,
  }) = _DummyModel;
}
