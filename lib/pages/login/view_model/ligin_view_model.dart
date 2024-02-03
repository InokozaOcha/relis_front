// 匿名ログイン
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relis/pages/login/view/login_page.dart';

Future<void> onSignInWithAnonymousUser() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  try {
    await firebaseAuth.signInAnonymously(); //匿名ログイン
    debugPrint("roguin");
    var aaa = FirebaseAuth.instance.currentUser;
    debugPrint(aaa?.uid);
  } catch (e) {
    debugPrint('エラー:$e');
  }
}

// 匿名ユーザー削除
Future<void> onDeleteAnonymousUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.currentUser!.delete(); //匿名ユーザー削除
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login())); // 匿名ユーザー削除後LoginPageに画面遷移
  } catch (e) {
    print('エラー:$e');
  }
}

Future<String?> logincheck() async {
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
      return "";
    }
    if (userID != "") {
      debugPrint("ログイン済み");
      debugPrint(userID);
      debugPrint(userToken.toString());
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

Future<String> userUid() async {
  final firebaseAuth = FirebaseAuth.instance;
  try {
    final userID = firebaseAuth.currentUser?.uid; //匿名ログイン
    if (userID == null) {
      return "nullです";
    }
    if (userID != "") {
      debugPrint(userID);
      return userID;
    } else {
      debugPrint("IDないです");
      return "";
    }
  } catch (e) {
    debugPrint('エラー:$e');
    return "hoooooooo";
  }
  return "なんかエラ〜";
}

Future<String?> signUp(String mail, String pass) async {
  try {
    debugPrint('登録開始');
    debugPrint(mail);
    debugPrint(pass);

    final firebaseAuth = FirebaseAuth.instance;
    final createUser = await firebaseAuth.createUserWithEmailAndPassword(
        email: mail, password: pass);
    debugPrint('登録完了');
    final user = createUser.user;
    debugPrint(user?.uid);

    user?.sendEmailVerification();
    debugPrint('メール送信したで');
    return user?.uid;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
      return "パスワード弱すぎ";
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
      return "すでに使われてるからダメ";
    }
    debugPrint('nnnnnnnnnnnnnnnnnnnnnnnn');
  } catch (e) {
    debugPrint('なんかミスってる');
    print(e);
  }
  debugPrint('yyyyyyyyyyyyyyyyyyyy');
  return "hoge";
}

Future<String?> emailLogin(String mail, String pass) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: pass);
    final userId = credential.user?.uid;

    return userId;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return "";
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return "";
    }
  }
  return "";
}

Future<void> loginCheckffffffff() async {
  try {
    final credential = FirebaseAuth.instance;

    //final userId = credential.user?.uid;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
