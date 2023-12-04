import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/router/router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // go_routerをプロバイダーで監視する.
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      // MaterialAppに.routerを追加する.
      routerConfig: goRouter, // このコードを追加すると画面遷移ができるようになる.
      title: 'flutter_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
