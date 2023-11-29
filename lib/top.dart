import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relis/base.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<FeaturePage>(
    //   create: (context) => FeaturePage(),
    //   child: DynamicColorBuilder(
    //     builder:(lightDynamic, darkDynamic) => ThemeProvider(
    //       lightDynamic: lightDynamic,
    //       darkDynamic: darkDynamic,
    //     )),
    // )
    //final theme = ThemeProvider.of(context);

    return MaterialApp.router(
        title: 'Relis',
        debugShowCheckedModeBanner: false,
        //theme: theme.light(settings.value.sourceColor),
        //darkTheme: theme.dark(settings.value.sourceColor),
        //themeMode: theme.themeMode(),
        // home: MakeListPage(),

        // routeInformationParser: goRouter.routeInformationParser,
        // routeInformationProvider: goRouter.routeInformationProvider,
        // routerDelegate: goRouter.routerDelegate,

        //routeInformationParser: appRouter.routeInformationParser,
        builder: (context, child) {
          return const Base();
        }
        //builder; FeaturePage(),
        );

    // return const MaterialApp(
    //   title: 'Relis',
    //   debugShowCheckedModeBanner: false,
    //   // home: MakeListPage(),
    //   home: FeaturePage(),
    // );
  }
}
