import 'package:flutter/material.dart';

import 'package:projeto_ia/models/csv_model.dart';

import '../bottom_sheet/bottom_sheet.dart';

class CsvBottomSheet extends StatefulWidget {
  final Function() onFinish;
  final CsvModel csv;

  const CsvBottomSheet({
    super.key,
    required this.onFinish,
    required this.csv,
  });

  @override
  State<CsvBottomSheet> createState() => _CsvBottomSheetState();
}

class _CsvBottomSheetState extends State<CsvBottomSheet> {
  bool loading = false;

  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget buildItem(
      String title,
      String subtitle,
      CrossAxisAlignment alignment,
    ) {
      return Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            alignment: alignment == CrossAxisAlignment.start
                ? Alignment.centerLeft
                : Alignment.centerRight,
            width: size.width / 2 - 20,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            alignment: alignment == CrossAxisAlignment.start
                ? Alignment.centerLeft
                : Alignment.centerRight,
            width: size.width / 2 - 20,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    Widget buildRow(List<Widget> children) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      );
    }

    Widget buildDescription() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Descrição',
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            widget.csv.description ?? '---',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      );
    }

    Widget button() {
      Widget child() {
        if (loading) {
          return const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        return const Text('%button%');
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            child: child(),
            onPressed: () async {
              setLoading(true);

              await Future.delayed(const Duration(seconds: 5), () {
                setLoading(false);
              });
            },
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRow([
          buildItem('Nome', widget.csv.name, CrossAxisAlignment.start),
          buildItem(
            'Dados',
            '${widget.csv.data?.length} itens',
            CrossAxisAlignment.end,
          ),
        ]),
        buildDescription(),
        button(),
      ],
    );
  }
}

void showCsvBottomSheet({
  required BuildContext context,
  required Function() onFinish,
  required CsvModel csv,
}) {
  createBottomSheet(
    context: context,
    title: 'Detalhes do ${csv.file}',
    child: CsvBottomSheet(onFinish: onFinish, csv: csv),
  );
}
