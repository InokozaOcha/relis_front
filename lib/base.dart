import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base_view_model.dart';
import 'package:relis/models/auth_model.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/pages/dummy2/view/dummy2_page.dart';
import 'package:relis/pages/login/view/login_page.dart';

class Base extends ConsumerWidget {
  const Base({super.key});
  static const rootName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State
    final authModel = ref.watch(AuthPageProvider);
    // Provider
    final authPageNotifirer = ref.watch(AuthPageProvider.notifier);

    //selectedIndex = authModel.number;
    Widget page;
    switch (authModel.number) {
      case 0:
        page = const Dummy1();
      case 1:
        page = const Dummy2();
      default:
        throw UnimplementedError(
            'no widget for ${authModel.number.toString()}');
    }
    var colorScheme = Theme.of(context).colorScheme;
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (authModel.haslogin == false) {
        return Login();
      } else {
        if (constraints.maxWidth < 450) {
          return Column(
            children: [
              Expanded(child: mainArea),
              SafeArea(
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                      ),
                      label: 'Favorites',
                    ),
                  ],
                  currentIndex: authModel.number,
                  onTap: (value) {
                    authPageNotifirer.changePage(value);
                  },
                ),
              )
            ],
          );
        } else {
          return Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                      ),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: authModel.number,
                  onDestinationSelected: (value) {
                    authPageNotifirer.changePage(value);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          );
        }
      }
    }));
  }
}
