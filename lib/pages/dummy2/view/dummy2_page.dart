import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view_model/dummy2_view_model.dart';

class Dummy2 extends ConsumerWidget {
  const Dummy2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final dummyPageNotifirer = ref.watch(dummy1PageProvider.notifier);
    //State
    final dummyModel = ref.watch(dummy1PageProvider);

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
            Text(dummyModel.number.toString())
          ],
        )));
  }
}
