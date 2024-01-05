import 'package:flutter/material.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chargement...'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE6007F)),
        ),
      ),
    );
  }
}
