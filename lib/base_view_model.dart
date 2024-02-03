import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:relis/models/auth_model.dart';
import 'package:relis/models/auth_model.dart';
import 'package:relis/models/dummy_model.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';
import 'package:relis/pages/login/view_model/ligin_view_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(const AuthModel());
  void countUp() {
    state = state.copyWith(number: state.number + 1);
  }

  void countDown() {
    state = state.copyWith(number: state.number - 1);
  }

  void toggleLogin() {
    state = state.copyWith(haslogin: !(state.haslogin));
  }

  void changePage(int no) {
    state = state.copyWith(number: no);
  }

  Future<void> setAnonymousUser() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInAnonymously();
    firebaseAuth.currentUser!.isAnonymous;
    state = state.copyWith(userId: firebaseAuth.currentUser!.uid);
    debugPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    debugPrint(firebaseAuth.currentUser!.uid);
  }

  void setUid() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var uid = "";
    if (firebaseAuth.currentUser != null) {
      if (firebaseAuth.currentUser?.uid != "") {
        uid = firebaseAuth.currentUser!.uid;
      }
    }

    state = state.copyWith(userId: uid);
    debugPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    debugPrint(firebaseAuth.currentUser!.uid);
  }

  void setUid2(String uid) {
    state = state.copyWith(userId: uid);
  }

  Future<void> checkUser() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var userId = firebaseAuth.currentUser?.uid;
    if (userId == "" || userId == null) {
      state = state.copyWith(userId: firebaseAuth.currentUser!.uid);
      firebaseAuth.currentUser!.isAnonymous;
      state = state.copyWith(userId: firebaseAuth.currentUser!.uid);
    }

    debugPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    debugPrint(firebaseAuth.currentUser!.uid);
  }

  Future<void> getApiData() async {
    const domain = 'http://133.18.178.138';
    const pass = '/api/test';
    //const query = '?lat=$lat&lon=$lon&exclude=daily&lang=ja&appid=$key';

    var url = Uri.parse(domain + pass);
    debugPrint('url: $url');
    var response = await http.get(url);
    debugPrint('response');
    debugPrint('statusCode: ${response.statusCode}');
    debugPrint('response: ${response.body}');
    //debugPrint(response.body);
    var aaa = jsonDecode(response.body);
    //var bbb = jsonDecode(aaa['testData']);
    // debugPrint('---');
    // debugPrint(aaa["testData"]);
    // debugPrint('---');
    aaa["testData"].forEach((key, value) {
      debugPrint('$key --- $value');
    });
    // debugPrint(aaa);
    // setState(() {
    //   items = aaa["testData"];
    // });
  }

  Future<void> signInMail(String mail, String pass) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: mail, password: pass);

      state = state.copyWith(userId: firebaseAuth.currentUser!.uid);
      state =
          state.copyWith(isAnonymous: firebaseAuth.currentUser!.isAnonymous);
      debugPrint("ログイン完了");
      debugPrint(mail);
      debugPrint(pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    state = state.copyWith(userId: "");
  }

  Future<String?> logincheck2x() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final userID = firebaseAuth.currentUser?.uid; //匿名ログイン
      final userToken = await firebaseAuth.currentUser?.getIdToken();
      if (userID == null) {
        // await onSignInWithAnonymousUser();
        // final anonymousUser = firebaseAuth.currentUser?.uid;
        const anonymousUser = "";
        debugPrint("あのにます");
        debugPrint(anonymousUser);
        state = state.copyWith(userId: "");
        return "";
      }
      if (userID != "") {
        debugPrint("ログイン済み");
        debugPrint(userID);
        debugPrint(userToken.toString());
        state = state.copyWith(userId: userID);
        return userID;
      } else {
        debugPrint("IDないです");
        return "";
      }

      debugPrint(firebaseAuth.currentUser?.uid);
    } catch (e) {
      debugPrint('エラー:$e');
    }
    return null;
  }

  // void changeUser() {
  //   var user = FirebaseAuth.instance.currentUser?.uid;
  //   state = state.copyWith(userId: user ?? "");
  // }

  page(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const Dummy1();
      case 1:
        page = const Dummy2();
      default:
        throw UnimplementedError('no widget for $index');
    }
    return page;
  }
}

final AuthPageProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthModel>(
  (ref) => AuthNotifier(),
);
