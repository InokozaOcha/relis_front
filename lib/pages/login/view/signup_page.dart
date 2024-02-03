import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view_model/dummy2_view_model.dart';
import 'package:relis/pages/login/view_model/ligin_view_model.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    var mail = TextEditingController();
    var pass = TextEditingController();
    var mailText = "";

    var errmsg = "";

    //authPageNotifirer.changeUser;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: mail,
                    decoration: const InputDecoration(
                      hintText: "メールアドレス",
                    ),
                  ),
                  TextField(
                    controller: pass,
                    decoration: const InputDecoration(
                      hintText: "パスワード",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
                    child: Text(
                      errmsg,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      debugPrint("サインアップ");

                      debugPrint(mail.text);
                      debugPrint(pass.text);

                      signUp(mail.text, pass.text);

                      //await onSignInWithAnonymousUser();
                      // authPageNotifirer.setAnonymousUser();
                      // authPageNotifirer.toggleLogin;
                      // debugPrint(authModel.userId);
                    },
                    child: const Text('Next'),
                  )
                ],
              ))),
    );
  }
}
