import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    @Default('') String title,
    @Default(1) int number,
    @Default(false) bool haslogin,
    @Default('') String userId,
  }) = _AuthModel;
}
