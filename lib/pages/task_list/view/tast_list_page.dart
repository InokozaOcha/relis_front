import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/pages/task_list/view_model/task_list_view_model.dart';
// import 'package:provider/provider.dart';

// import '../../bbs/view/bbs_page.dart';
// import '../view_model/auth_view_model.dart';
// import 'error_page.dart';
// import 'sign_in_page.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final _taskListModel = ref.watch(taskListProvider);
    // Provider
    final _taskListNotifirer = ref.watch(taskListProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(_taskListModel.textTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _taskListNotifirer.resetAll,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Title'),
              onChanged: (text) {
                _taskListNotifirer.setTextTitele(text);
              },
            ),
          ),
          ListTile(
            title: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: '1'),
              onChanged: (text) {
                _taskListNotifirer.setNumber(
                    int.parse(text), _taskListModel.endNumber);
                _taskListNotifirer.setList(
                    int.parse(text), _taskListModel.endNumber);
              },
            ),
            //title: Text('aaa'),
            //onTap: _testPageNotifirer.increaseMainCount,
          ),
          ListTile(
            //title: Text('bbb'),
            title: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: '100'),
              onChanged: (text) {
                _taskListNotifirer.setNumber(
                    _taskListModel.startNumber, int.parse(text));
                _taskListNotifirer.setList(
                    _taskListModel.startNumber, int.parse(text));
              },
            ),
            //onTap: _testPageNotifirer.increaseSubCount,
          ),
          const ListTile(
            title: Text('Next Page'),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const NextPage()),
            //   );
            // },
          ),
          for (final schedule in _taskListModel.schedule)
            CheckboxListTile(
              title: Text(schedule.number.toString()),
              value: schedule.execute,
              onChanged: (bool? value) {
                int index = schedule.number - _taskListModel.startNumber;
                _taskListNotifirer.setExecute(index);
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
        ],
      ),
    );
  }
}
