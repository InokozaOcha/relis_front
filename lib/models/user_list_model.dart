import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relis/commons/ScheduledDate.dart';

// 生成されるファイル名を指定する（ `生成元ファイル名.freezed.dart` ）
part 'task_list_model.freezed.dart';

@freezed
class TaskListModel with _$TaskListModel {
  const factory TaskListModel({
    @Default('') String textTitle,
    required DateTime startDate,
    required DateTime endDate,
    @Default(1) int startNumber,
    @Default(1) int endNumber,
    @Default([]) List<ScheduledDate> schedule,
  }) = _TaskListModel;
}
