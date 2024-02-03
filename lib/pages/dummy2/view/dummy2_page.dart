import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view_model/dummy2_view_model.dart';

class Dummy2 extends ConsumerWidget {
  const Dummy2({super.key});
  static const rootName = 'd2';
  //static const rootName2 = '/next';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final dummyPageNotifirer = ref.watch(dummy1PageProvider.notifier);
    //State
    final dummyModel = ref.watch(dummy1PageProvider);

    //State
    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: dummyPageNotifirer.countDown,
          child: const Icon(Icons.exposure_zero),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            const Text('Dummy2'),
            Text('タイトル ${dummyModel.title}'),
            Text(dummyModel.number.toString()),
            OutlinedButton(
              //onPressed: authPageNotifirer.toggleLogin,
              onPressed: () {
                debugPrint("ログアウおと");
                authPageNotifirer.logout();
              },
              child: const Text('ログアウト'),
            )
          ],
        )));
  }
}
