import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

import 'package:projeto_ia/models/csv_model.dart';

class CsvItem extends StatefulWidget {
  final CsvModel csv;

  const CsvItem({
    super.key,
    required this.csv,
  });

  @override
  State<CsvItem> createState() => _CsvItemState();
}

class _CsvItemState extends State<CsvItem> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    final rawData = await rootBundle.loadString("assets/${widget.csv.file}");

    List<dynamic> listData = const CsvToListConverter().convert(
      rawData,
      eol: '\n',
    );

    setState(() {
      _data = listData;
      widget.csv.data = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.csv.name),
      subtitle: Text('${_data.length} itens'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).pushNamed('csv', arguments: widget.csv);
      },
    );
  }
}
