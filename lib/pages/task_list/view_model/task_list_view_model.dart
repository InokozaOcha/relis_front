import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/commons/ScheduledDate.dart';

import 'package:relis/models/task_list_model.dart';
import 'package:relis/pages/task_list/view/tast_list_page.dart';

class TaskListNotifier extends StateNotifier<TaskListModel> {
  TaskListNotifier()
      : super(
            TaskListModel(startDate: DateTime.now(), endDate: DateTime.now()));

  void setTextTitele(String title) async {
    state = state.copyWith(textTitle: title);
  }

  void setNumber(int start, int end) async {
    if (start <= end) {
      state = state.copyWith(startNumber: start, endNumber: end);
    } else {
      state = state.copyWith(startNumber: start, endNumber: start);
    }
  }

  // すべてのカウントを0に戻す
  void resetAll() async {
    state = state.copyWith(textTitle: '', startNumber: 1, endNumber: 1);
  }

  void setList(int start, int end) async {
    int s = start;
    int e = end;
    if (start > end) {
      e = s;
    }

    List<ScheduledDate> list = [];
    for (int i = s; i <= e; i++) {
      list.add(ScheduledDate(number: i, date: DateTime.now(), execute: true));
    }
    state = state.copyWith(schedule: list);
  }

  void setExecute(int index) {
    List<ScheduledDate> list = state.schedule;
    list[index].execute = !list[index].execute;
    state = state.copyWith(schedule: list);
  }
}

final taskListProvider =
    StateNotifierProvider.autoDispose<TaskListNotifier, TaskListModel>(
  (ref) => TaskListNotifier(),
);
