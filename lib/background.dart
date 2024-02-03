import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/enum/tab_item.dart';

import 'package:relis/pages/login/view/login_page.dart';
import 'package:relis/pages/login/view_model/ligin_view_model.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.timeline: GlobalKey<NavigatorState>(),
};

class Background extends HookConsumerWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State

    final authModel = ref.watch(AuthPageProvider);
    // // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    final uid = FirebaseAuth.instance.currentUser?.uid;
    debugPrint('初回起動');

    //selectedIndex = authModel.number;
    var sideBarKey = GlobalKey<ScaffoldState>();
    sideBarKey.currentState?.openDrawer();
    final currentTab = useState(TabItem.home);

    if (uid != null) {
      if (MediaQuery.of(context).size.width < 800) {
        return Scaffold(
          body: Stack(
            children: TabItem.values
                .map(
                  (tabItem) => Offstage(
                    offstage: currentTab.value != tabItem,
                    child: Navigator(
                      key: _navigatorKeys[tabItem],
                      onGenerateRoute: (settings) {
                        return MaterialPageRoute<Widget>(
                          builder: (context) => tabItem.page,
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: TabItem.values.indexOf(currentTab.value),
            items: TabItem.values
                .map(
                  (tabItem) => BottomNavigationBarItem(
                    icon: Icon(tabItem.icon),
                    label: tabItem.title,
                  ),
                )
                .toList(),
            onTap: (index) {
              final selectedTab = TabItem.values[index];
              debugPrint(currentTab.value.toString());
              debugPrint(selectedTab.toString());
              if (currentTab.value == selectedTab) {
                _navigatorKeys[selectedTab]
                    ?.currentState
                    ?.popUntil((route) => route.isFirst);
              } else {
                // 未選択
                currentTab.value = selectedTab;
              }
            },
          ),
        );
      } else {
        return Scaffold(
          key: sideBarKey,
          body: Row(children: [
            SizedBox(
              width: 200,
              child: Drawer(
                child: ListView(
                  children: TabItem.values
                      .asMap()
                      .entries
                      .map(
                        (tabItem) => ListTile(
                          //icon: Icon(tabItem.icon),
                          leading: Icon(tabItem.value.icon),
                          title: Text(tabItem.value.title),
                          onTap: () {
                            debugPrint(tabItem.key.toString());
                            final selectedTab = tabItem.key;
                            final selectedTab2 = tabItem.value;
                            debugPrint(selectedTab.toString());
                            debugPrint(selectedTab2.toString());
                            //if (currentTab.value.index == TabItem.home) {
                            if (currentTab.value.index == selectedTab) {
                              debugPrint('一致です');
                              _navigatorKeys[selectedTab]
                                  ?.currentState
                                  ?.popUntil((route) => route.isFirst);
                            } else {
                              // 未選択
                              currentTab.value = selectedTab2;
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Expanded(
                child: Stack(
              children: TabItem.values
                  .map(
                    (tabItem) => Offstage(
                      offstage: currentTab.value != tabItem,
                      child: Navigator(
                        key: _navigatorKeys[tabItem],
                        onGenerateRoute: (settings) {
                          return MaterialPageRoute<Widget>(
                            builder: (context) => tabItem.page,
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            ))
          ]),
        );
      }
    } else {
      return const Login();
    }
  }
}
