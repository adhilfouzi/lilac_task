import 'package:flutter/material.dart';

import '../../data/models/chat_models.dart';
import '../../feature/auth/otp_screen.dart';
import '../../feature/auth/phone_number_screen.dart';
import '../../feature/auth/boarding_screen.dart';
import '../../feature/chat/chat_screen.dart';
import '../../feature/chat/message_screen.dart';
import '../../feature/home/home_screen.dart';

class AppRoutes {
  AppRoutes._();
  // Auth routes
  static const String boardingScreen = '/';
  static const String loginWithPhone = '/loginWithPhone';
  static const String otp = '/otp';
  static const String home = '/home';
  static const String chatScreen = '/chatScreen';
  static const String messageScreen = '/messageScreen';
  static final Map<String, WidgetBuilder> routes = {
    boardingScreen: (context) => BoardingScreen(),
    loginWithPhone: (context) => PhoneAuthScreen(),
    otp: (context) => OTPScreen(),
    home: (context) => HomeScreen(),
    messageScreen: (context) => MessageScreen(),
  };

  /// Handles routes dynamically, including those that require arguments.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chatScreen:
        final chatUser = settings.arguments as ChatUser?;
        if (chatUser != null) {
          return _customPageRoute(ChatScreen(user: chatUser));
        }
        return _errorRoute();

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
