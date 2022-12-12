import 'package:flutter/material.dart';

import 'package:projeto_ia/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'main': (context) => const MainPage(),
      },
      initialRoute: 'main',
    );
  }
}
