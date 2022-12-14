import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';

import 'package:projeto_ia/models/csv_model.dart';
import 'package:projeto_ia/widgets/csv_bottom_sheet/csv_bottom_sheet.dart';
import 'package:projeto_ia/widgets/csv_item/csv_item.dart';
import 'package:projeto_ia/widgets/snack_bar/snack_bar.dart';

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

        List<String> split = file.path.split('.');
        String type = split[split.length - 1];

        if (type != 'csv') {
          Future.delayed(const Duration(seconds: 0), () {
            sendSnackBar(
              context: context,
              message: 'Somente arquivos .csv são suportados.',
            );
          });
          return;
        }

        List<dynamic> data = const CsvToListConverter().convert(
          await file.readAsString(),
          //eol: '\n',
        );

        final csv = CsvModel.temporaryCsv(file, data);
        Future.delayed(const Duration(seconds: 0), () {
          showCsvBottomSheet(context: context, onFinish: () {}, csv: csv);
        });
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
