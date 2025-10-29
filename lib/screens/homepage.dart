import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Home'),
        backgroundColor: const Color(0xFF4169E1),
      ),
      body: const Center(
        child: Text(
          'You are now logged in!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
