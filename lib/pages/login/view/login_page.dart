import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view_model/dummy2_view_model.dart';

class Login extends ConsumerWidget {
  const Login({super.key});
  //static const rootName2 = '/next';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: <Widget>[
            const Text('ログインしてませんね'),
            Text(authModel.haslogin.toString()),
            OutlinedButton(
              onPressed: authPageNotifirer.toggleLogin,
              child: const Text('Next'),
            )
          ],
        )));
  }
}
