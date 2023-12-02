import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/models/dummy_model.dart';

class Dummy1Notifier extends StateNotifier<DummyModel> {
  Dummy1Notifier() : super(const DummyModel());
  void countUp() {
    state = state.copyWith(number: state.number + 1);
  }

  void countDown() {
    state = state.copyWith(number: state.number - 1);
  }
}

final dummy1PageProvider =
    StateNotifierProvider.autoDispose<Dummy1Notifier, DummyModel>(
  (ref) => Dummy1Notifier(),
);
