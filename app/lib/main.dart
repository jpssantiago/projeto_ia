import 'package:flutter/material.dart';

import 'package:projeto_ia/pages/main/main_page.dart';
import 'package:projeto_ia/pages/result/result_page.dart';
import 'package:projeto_ia/pages/create_csv/create_csv_page.dart';

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
        'result': (context) => const ResultPage(),
        'create_csv': (context) => const CreateCsvPage(),
      },
      initialRoute: 'main',
    );
  }
}
