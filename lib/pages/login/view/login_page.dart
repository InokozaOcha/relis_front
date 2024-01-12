import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view_model/dummy2_view_model.dart';

class Login extends ConsumerWidget {
  const Login({super.key});
  //static const rootName2 = '/next';

  // void onSignInWithAnonymousUser() async {
  //   await FirebaseAuth.instance.signInAnonymously().then((value) {
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     print(error);
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    //authPageNotifirer.changeUser;

    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: "value"),
            ),
            TextFormField(
              initialValue: 'Hello World',
            ),

            //const Text('ログインしてませんね'),
            Text(authModel.haslogin.toString()),
            Text(authModel.haslogin.toString()),
            OutlinedButton(
              onPressed: authPageNotifirer.toggleLogin,
              child: const Text('Next'),
            )
          ],
        )));
  }
}
