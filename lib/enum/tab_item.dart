import 'package:flutter/material.dart';

import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';

enum TabItem {
  home(
    title: 'ホーム',
    icon: Icons.home,
    page: Dummy1(),
  ),

  timeline(
    title: 'タイムライン',
    icon: Icons.timeline,
    page: Dummy2(),
  );

  // settings(
  //   title: '設定',
  //   icon: Icons.settings,
  //   page: SettingsPage(),
  // );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}
