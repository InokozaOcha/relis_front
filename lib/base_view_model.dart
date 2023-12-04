import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/models/auth_model.dart';
import 'package:relis/models/dummy_model.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(const AuthModel());
  void countUp() {
    state = state.copyWith(number: state.number + 1);
  }

  void countDown() {
    state = state.copyWith(number: state.number - 1);
  }

  void toggleLogin() {
    state = state.copyWith(haslogin: !(state.haslogin));
  }

  void changePage(int no) {
    state = state.copyWith(number: no);
  }

  page(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const Dummy1();
      case 1:
        page = const Dummy2();
      default:
        throw UnimplementedError('no widget for $index');
    }
    return page;
  }
}

final AuthPageProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthModel>(
  (ref) => AuthNotifier(),
);
