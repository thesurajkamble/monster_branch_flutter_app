import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Does your tribe need a monster?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'If members of your tribe need to sit with a monster, refer them now.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your functionality here
            },
            child: const Text('Refer a friend'),
          ),
        ],
      ),
    );
  }
}
