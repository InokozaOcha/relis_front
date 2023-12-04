import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:relis/base.dart';

import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: <RouteBase>[
      // 最初に表示されるページ.
      GoRoute(
        path: '/', // トップレベルのパスが必要なので指定する.
        name: Base.rootName, // 名前付きルートを指定する.
        builder: (BuildContext context, GoRouterState state) {
          return const Base();
        },
        //ネストしたルートを指定する.
        routes: <RouteBase>[
          GoRoute(
            path: 'next',
            name: Dummy1.rootName,
            builder: (BuildContext context, GoRouterState state) {
              return const Dummy2();
            },
          ),
        ],
      ),
      // ネストしていないルート。戻るボタンがAppBarに表示されない.
      GoRoute(
        path: '/d2',
        name: Dummy2.rootName,
        builder: (BuildContext context, GoRouterState state) {
          return const Dummy2();
        },
      ),
    ],
  );
});
