import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';

import 'package:projeto_ia/models/csv_model.dart';
import 'package:projeto_ia/services/api_service.dart';
import 'package:projeto_ia/widgets/csv_bottom_sheet/csv_bottom_sheet.dart';
import 'package:projeto_ia/widgets/csv_item/csv_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CsvModel> csvs = [
      CsvModel(
        id: 'iris',
        name: 'Iris',
        file: 'iris.csv',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas laoreet viverra justo, ac vulputate dolor posuere in. Curabitur vitae nulla et nunc convallis.',
      ),
      CsvModel(
        id: 'kindacode',
        name: 'KindaCode',
        file: 'kindacode.csv',
      ),
      CsvModel(
        id: 'wine',
        name: 'Vinho',
        file: 'wine.csv',
        description:
            'Odio posuere eu. Phasellus eget erat mauris. Suspendisse lacinia augue risus, sit amet tincidunt dolor imperdiet vitae.',
      ),
      CsvModel(
        id: 'adult',
        name: 'Adult',
        file: 'adult.csv',
        description:
            'Curabitur ornare nec elit non iaculis. Curabitur erat sem, dapibus vel ullamcorper in, auctor in dui. Pellentesque interdum ipsum ac leo laoreet rhoncus.',
      ),
    ];

    void loadFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);

        List<dynamic> data = const CsvToListConverter().convert(
          await file.readAsString(),
          //eol: '\n',
        );

        final csv = CsvModel.temporaryCsv(file, data);
        Future.delayed(const Duration(seconds: 0), () {
          showCsvBottomSheet(context: context, onFinish: () {}, csv: csv);
        });
      } else {
        // User canceled the picker
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
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
