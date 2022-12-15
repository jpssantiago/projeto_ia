import 'package:flutter/material.dart';

import 'package:projeto_ia/services/api_service.dart';

class CreateCsvPage extends StatefulWidget {
  const CreateCsvPage({super.key});

  @override
  State<CreateCsvPage> createState() => _CreateCsvPageState();
}

class _CreateCsvPageState extends State<CreateCsvPage> {
  bool loading = false;
  int k = 1;

  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget textField() {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Ex: 1.2,5,7.8\nEx: 7.5,8,.9',
              border: InputBorder.none,
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
        ),
      );
    }

    Widget separator() {
      return Container(
        width: double.infinity,
        height: 1,
        color: Colors.black.withOpacity(.1),
      );
    }

    Widget buildKSelector() {
      Widget decrement() {
        return GestureDetector(
          child: const Icon(Icons.remove, size: 30),
          onTap: () {
            setState(() {
              k = k == 1 ? 1 : k - 1;
            });
          },
        );
      }

      Widget value() {
        return Column(
          children: [
            const Text('valor de k'),
            const SizedBox(height: 3),
            Text(
              k.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        );
      }

      Widget increment() {
        return GestureDetector(
          child: const Icon(Icons.add, size: 30),
          onTap: () {
            setState(() {
              k += 1;
            });
          },
        );
      }

      return Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              decrement(),
              value(),
              increment(),
            ],
          ),
        ),
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

        return const Text('Executar kMeans');
      }

      return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 30,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            child: child(),
            onPressed: () async {
              setLoading(true);

              final text = controller.text;
              final image = await ApiService.sendRawData(text, k);

              Future.delayed(const Duration(seconds: 0), () {
                Navigator.of(context).pushNamed('scatter', arguments: image);
              });

              setLoading(false);
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar .csv'),
      ),
      body: Column(
        children: [
          textField(),
          separator(),
          buildKSelector(),
          button(),
        ],
      ),
    );
  }
}
