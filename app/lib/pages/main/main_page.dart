import 'package:flutter/material.dart';

import 'package:projeto_ia/models/csv_model.dart';
import 'package:projeto_ia/widgets/csv_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CsvModel> csvs = [
      CsvModel(id: 'iris', name: 'Iris', file: 'iris.csv'),
      CsvModel(id: 'kindacode', name: 'KindaCode', file: 'kindacode.csv'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha de .csv'),
      ),
      body: ListView.builder(
        itemCount: csvs.length,
        itemBuilder: (context, index) {
          return CsvItem(csv: csvs[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
