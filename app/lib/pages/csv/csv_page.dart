import 'package:flutter/material.dart';

import 'package:projeto_ia/models/csv_model.dart';

class CsvPage extends StatelessWidget {
  const CsvPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final CsvModel csv = args as CsvModel;

    if (csv.data == null) {
      Future.delayed(const Duration(seconds: 0), () {
        Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${csv.name} - ${csv.data!.length} itens'),
      ),
      body: SingleChildScrollView(
        child: Table(
          children: csv.data!.map((item) {
            final list = item as List<dynamic>;
            return TableRow(
              children: list.map((e) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    e.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
