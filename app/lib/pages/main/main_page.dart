import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

import 'package:projeto_ia/models/csv_model.dart';
import 'package:projeto_ia/widgets/csv_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CsvModel> csvs = [
      CsvModel(id: 'iris', name: 'Iris', file: 'iris.csv'),
      CsvModel(id: 'kindacode', name: 'KindaCode', file: 'kindacode.csv'),
      CsvModel(id: 'wine', name: 'Vinho', file: 'wine.csv'),
      CsvModel(id: 'adult', name: 'Adult', file: 'adult.csv'),
    ];

    void loadFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);

        List<dynamic> data = const CsvToListConverter().convert(
          await file.readAsString(),
          //eol: '\n',
        );

        final response = await http.post(
          Uri.parse('http://localhost:8080/csv'),
          body: data.toString(),
        );

        print(response.body);
      } else {
        // User canceled the picker
      }
    }

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
        onPressed: loadFile,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
