import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/enum/tab_item.dart';
import 'package:relis/models/auth_model.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';
import 'package:relis/pages/login/view/login_page.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.timeline: GlobalKey<NavigatorState>(),
};

class Base4 extends HookWidget {
  const Base4({super.key});

  @override
  Widget build(BuildContext context) {
    //State
    // final authModel = ref.watch(AuthPageProvider);
    // // Provider
    // final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    //selectedIndex = authModel.number;
    final currentTab = useState(TabItem.home);

    var colorScheme = Theme.of(context).colorScheme;
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Dummy1(),
      ),
    );

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return Column(children: [
          Expanded(child: mainArea),
          SafeArea(
              child: BottomNavigationBar(
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
              if (currentTab.value == selectedTab) {
                _navigatorKeys[selectedTab]
                    ?.currentState
                    ?.popUntil((route) => route.isFirst);
              } else {
                // 未選択
                currentTab.value = selectedTab;
              }
            },
          ))
        ]);
      } else {
        return Row(
          children: [
            SafeArea(
                child: NavigationRail(
              extended: constraints.maxWidth >= 600,
              destinations: TabItem.values
                  .map((tabItem) => NavigationRailDestination(
                      icon: Icon(tabItem.icon), label: Text(tabItem.title)))
                  .toList(),
              selectedIndex: 1,
            )),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Dummy1(),
              ),
            ),
          ],
        );
      }
      ;
    }));
    if (MediaQuery.of(context).size.width > 800) {
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
        drawer: Drawer(
          //type: BottomNavigationBarType.fixed,
          //currentIndex: TabItem.values.indexOf(currentTab.value),
          child: ListView(
            children: [
              ListTile(
                title: const Text("メニュー1"),
                onTap: () {
                  // この中にメニューをタップした時の処理を記述する
                },
              ),
              ListTile(
                title: const Text("メニュー2"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("メニュー3"),
                onTap: () {},
              )
            ],
          ),
        ),
      );
    }
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
  }
}
