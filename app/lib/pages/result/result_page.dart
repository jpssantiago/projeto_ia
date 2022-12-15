import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final image = args as ImageProvider;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scatter'),
      ),
      body: Center(
        child: Image(image: image),
      ),
    );
  }
}
