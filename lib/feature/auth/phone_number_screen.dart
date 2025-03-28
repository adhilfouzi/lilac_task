import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lilac_task/utils/const/snackbar.dart';
import 'package:provider/provider.dart';

import '../../utils/routes/app_routes.dart';
import '../../providers/auth_provider.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Enter your phone\nnumber",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            IntlPhoneField(
              controller: authProvider.phoneController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.pink),
                ),
                prefixIcon: const Icon(Icons.phone_iphone, color: Colors.grey),
                hintText: "974568 1203",
                hintStyle:
                    GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                log(phone.completeNumber);
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Fliq will send you a text with a verification code.",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.pink,
                ),
                onPressed: () {
                  final phone = authProvider.phoneController.text;
                  if (phone.isNotEmpty) {
                    Navigator.pushNamed(context, AppRoutes.otp);
                  } else {
                    MySnackbar.showInfo(context, "Please enter a phone number");
                  }
                },
                child: Text(
                  "Next",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
