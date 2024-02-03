import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/enum/tab_item.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';

import 'package:relis/pages/login/view/login_page.dart';
import 'package:relis/pages/login/view_model/ligin_view_model.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.timeline: GlobalKey<NavigatorState>(),
};

class Base6 extends HookConsumerWidget {
  const Base6({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    //final aaa = FirebaseAuth.instance.authStateChanges();

    final authModel = ref.watch(AuthPageProvider);
    // // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        const Login();
      } else {
        debugPrint('User is signed in!');
        debugPrint(user.uid);
        authPageNotifirer.setUid2(user.uid);
        //return const Login();
      }
    });

    final aaa = FirebaseAuth.instance.currentUser?.uid;
    //selectedIndex = authModel.number;
    var sideBarKey = GlobalKey<ScaffoldState>();
    sideBarKey.currentState?.openDrawer();
    final currentTab = useState(TabItem.home);

    //authPageNotifirer.logincheck2();
    //authPageNotifirer.checkUser();
    //if (authModel.haslogin) {

    // ignore: unrelated_type_equality_checks
    //final userdata = FirebaseAuth.instance.currentUser;
    // debugPrint("`ログインのチェック");

    // debugPrint(authModel.userId);
    // ignore: unrelated_type_equality_checks

    //if (userdata?.uid != "" && userdata?.uid != null) {
    //if (authModel.userId != "") {
    if (aaa != null) {
      return const Dummy1();
    } else {
      return const Login();
    }
  }
}
