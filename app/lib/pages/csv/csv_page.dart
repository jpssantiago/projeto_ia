import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

import 'package:projeto_ia/models/csv_model.dart';

class CsvPage extends StatefulWidget {
  const CsvPage({super.key});

  @override
  State<CsvPage> createState() => _CsvPageState();
}

class _CsvPageState extends State<CsvPage> {
  CsvModel? csv;
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    Future.delayed(const Duration(seconds: 0), () async {
      final args = ModalRoute.of(context)!.settings.arguments;
      csv = args as CsvModel;

      final rawData = await rootBundle.loadString("assets/${csv!.file}");

      List<dynamic> listData = const CsvToListConverter().convert(
        rawData,
        eol: '\n',
      );

      setState(() {
        _data = listData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(csv?.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Table(
          children: _data.map((item) {
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
