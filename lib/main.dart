import 'package:flutter/material.dart';
import 'package:lilac_task/app_routes.dart';
import 'notfoundscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fliq Dating',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => NotFoundScreen(routeName: settings.name),
      ),
    );
  }
}
