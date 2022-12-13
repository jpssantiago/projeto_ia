import 'dart:io';

import 'package:uuid/uuid.dart';

class CsvModel {
  String id;
  String name;
  String file;
  String? description;
  List<dynamic>? data;

  CsvModel({
    required this.id,
    required this.name,
    required this.file,
    this.description,
    this.data,
  });

  static CsvModel temporaryCsv(File file, List<dynamic> data) {
    return CsvModel(
      id: const Uuid().v4(),
      name: file.path,
      file: file.path,
      data: data,
    );
  }
}
