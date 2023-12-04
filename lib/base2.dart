import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';
import 'package:relis/router/router.dart';

class Base2 extends ConsumerWidget {
  const Base2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final Size size = MediaQuery.of(context).size;
    return MaterialApp.router(
      // MaterialAppに.routerを追加する.
      routerConfig: goRouter, // このコードを追加すると画面遷移ができるようになる.
      title: size.width.toString(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
