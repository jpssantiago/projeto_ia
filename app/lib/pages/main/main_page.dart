import 'package:flutter/material.dart';

import 'package:projeto_ia/models/csv_model.dart';

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
        title: const Text('Início'),
      ),
      body: ListView.builder(
        itemCount: csvs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text(csvs[index].name),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed('csv', arguments: csvs[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
