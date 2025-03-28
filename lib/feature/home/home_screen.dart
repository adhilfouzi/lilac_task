import 'package:flutter/material.dart';

import '../../utils/routes/app_routes.dart';

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
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.messageScreen),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
