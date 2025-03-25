import 'package:flutter/material.dart';

import '../chat/message_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessageScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
