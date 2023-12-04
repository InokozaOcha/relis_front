import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relis/base.dart';
import 'package:relis/base2.dart';
import 'package:relis/base3.dart';
import 'package:relis/base4.dart';
import 'package:relis/base5.dart';
import 'package:relis/pages/dummy1/view/dummy1_page.dart';
import 'package:relis/top.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      child: MaterialApp(
          title: 'Relis',
          theme: ThemeData.light(), // ライト用テーマ
          darkTheme: ThemeData.dark(), // ダーク用テーマ
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: Base5())));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Relis',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
//       ),
//       home: const Base(),
//     );
//   }
// }
