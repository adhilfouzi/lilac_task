import 'package:flutter/material.dart';
import 'package:lilac_task/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'utils/routes/notfoundscreen.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fliq Dating',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.boardingScreen,
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
