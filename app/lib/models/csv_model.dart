class CsvModel {
  String id;
  String name;
  String file;
  List<dynamic>? data;

  CsvModel({
    required this.id,
    required this.name,
    required this.file,
    this.data,
  });
}
