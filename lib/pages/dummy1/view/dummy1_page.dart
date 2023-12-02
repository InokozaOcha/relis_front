import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';

class Dummy1 extends ConsumerWidget {
  const Dummy1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final dummyModel = ref.watch(dummy1PageProvider);
    // Provider
    final dummyPageNotifirer = ref.watch(dummy1PageProvider.notifier);
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: dummyPageNotifirer.countUp,
          child: const Icon(Icons.exposure_zero),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            const Text('Dummy1'),
            Text('タイトル ${dummyModel.title}'),
            Text(dummyModel.number.toString()),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dummy2()));
              },
              child: const Text('Next'),
            )
          ],
        )));
  }
}
