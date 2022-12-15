import 'package:flutter/material.dart';

import 'package:projeto_ia/pages/main/main_page.dart';
import 'package:projeto_ia/pages/scatter/scatter_page.dart';
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
        'scatter': (context) => const ScatterPage(),
        'create_csv': (context) => const CreateCsvPage(),
      },
      initialRoute: 'main',
      debugShowCheckedModeBanner: false,
    );
  }
}
