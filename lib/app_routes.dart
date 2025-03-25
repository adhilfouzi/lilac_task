import 'package:flutter/material.dart';

import 'phone_number_screen.dart';
import 'splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  // Auth routes
  static const String splash = '/';
  static const String loginWithPhone = '/loginWithPhone';
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    loginWithPhone: (context) => PhoneAuthScreen(),
  };

  /// Handles routes dynamically, including those that require arguments.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case category:
      //   final category = settings.arguments as CategoryModel?;
      //   if (category != null) {
      //     return _customPageRoute(
      //       CategoriesScreen(category: category),
      //     );
      //   }
      //   return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  /// Generates a default error route for invalid navigation attempts.
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('Error: Invalid Route or Missing Arguments')),
      ),
    );
  }

  /// Custom page route with smooth transition.
  static PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0); // Slide from right
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
