import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/routes/app_routes.dart';
import '../../utils/const/images.dart';
import 'social_button.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Images.splashScreen, fit: BoxFit.cover),
          Container(
            color: Colors.black.withValues(alpha: 0.3),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                Images.logo,
                height: 60,
              ),
              const SizedBox(height: 20),
              Text(
                "Connect. Meet. Love.\nWith Fliq Dating",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              SocialButton(
                icon: Images.googleIcon,
                text: "Sign in with Google",
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {},
              ),
              SocialButton(
                icon: Images.facebookIcon,
                text: "Sign in with Facebook",
                color: const Color(0xFF3B5998),
                textColor: Colors.white,
                onPressed: () {},
              ),
              SocialButton(
                icon: Images.phoneIcon,
                text: "Sign in with phone number",
                color: Colors.pink,
                textColor: Colors.white,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.loginWithPhone),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(
                    text: "By signing up, you agree to our ",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: ". See how we use your data in our "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
