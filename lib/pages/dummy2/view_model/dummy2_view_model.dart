import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/models/dummy_model.dart';

class Dummy2Notifier extends StateNotifier<DummyModel> {
  Dummy2Notifier() : super(DummyModel());
  void countDown() {
    state = state.copyWith(number: state.number - 1);
  }
}

final dummy2PageProvider =
    StateNotifierProvider.autoDispose<Dummy2Notifier, DummyModel>(
  (ref) => Dummy2Notifier(),
);
