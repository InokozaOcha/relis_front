import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/pages/dummy1/view_model/dummy1_view_model.dart';
import 'package:relis/pages/dummy2/view_model/dummy2_view_model.dart';
import 'package:relis/pages/login/view/signup_page.dart';
import 'package:relis/pages/login/view_model/ligin_view_model.dart';

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

  // initstate() {
  //   debugPrint("aaaaaaaaaaaaaaaaaaa");
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    var mail = TextEditingController();
    var pass = TextEditingController();

    //authPageNotifirer.setUid();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: mail,
                    decoration: InputDecoration(
                      hintText: "メールアドレス",
                    ),
                  ),
                  TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                      hintText: "パスワード",
                    ),
                    //obscureText: true,
                  ),

                  //const Text('ログインしてませんね'),
                  Text(mail.text),
                  Text(pass.text),
                  //TextButton(onPressed: authPageNotifirer.logincheck2(), child: const Text("aa")),
                  //Text(authModel.haslogin.toString()),
                  //Text(authModel.haslogin.toString()),
                  ElevatedButton(
                    child: Text("ログイン"),
                    onPressed: () async {
                      //emailLogin(mail.text, pass.text);
                      debugPrint("ppppppppppppppppppp");
                      debugPrint(mail.text);
                      authPageNotifirer.signInMail(mail.text, pass.text);

                      debugPrint("qqqqqqqqqqqqqqqqqqqqq");
                    },
                  ),

                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text("アカウントを新規作成")),
                  OutlinedButton(
                    onPressed: () async {
                      debugPrint("Login");

                      //await onSignInWithAnonymousUser();
                      authPageNotifirer.setAnonymousUser();
                      authPageNotifirer.toggleLogin;
                      debugPrint(authModel.userId);
                    },
                    child: const Text('Next'),
                  )
                ],
              ))),
    );
  }
}
