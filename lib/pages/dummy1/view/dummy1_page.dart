import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';
import 'package:relis/pages/login/view_model/ligin_view_model.dart';

class Dummy1 extends ConsumerWidget {
  const Dummy1({super.key});
  static const rootName = 'd1';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final dummyModel = ref.watch(dummy1PageProvider);
    // Provider
    final dummyPageNotifirer = ref.watch(dummy1PageProvider.notifier);

    //final userdata = FirebaseAuth.instance.currentUser;

    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);
    // final uidData = userUid();
    //debugPrint(userdata?.uid ?? "aaa");
    final user = FirebaseAuth.instance.currentUser;

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
            Text(authModel.userId),
            //(authModel.isAnonymous) ? Text("匿名です") : Text("メール認証です"),
            (user!.isAnonymous) ? Text("匿名です") : Text("メール認証です"),
            Text(dummyModel.number.toString()),
            //Text(uidData as String),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dummy2()));
                //context.goNamed(Dummy2.rootName);
              },
              child: const Text('Next'),
            ),
            OutlinedButton(
                onPressed: () {
                  authPageNotifirer.getApiData();
                },
                child: const Text('API'))
          ],
        )));
  }
}
