import 'package:flutter/material.dart';

class ScatterPage extends StatelessWidget {
  const ScatterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final image = args as ImageProvider;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização Scatter'),
      ),
      body: Center(
        child: Image(image: image),
      ),
      backgroundColor: Colors.white,
    );
  }
}
