import 'package:flutter/material.dart';
import '../utils/http/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  TextEditingController get phoneController => _phoneController;
  TextEditingController get otpController => _otpController;

  // Send OTP
  Future<bool> requestOtp() async {
    final phone = _phoneController.text;
    _otpController.clear();
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    bool success = await AuthApi.sendOtp(phone);

    _isLoading = false;
    if (!success) {
      _errorMessage = "Failed to send OTP. Try again.";
    }
    notifyListeners();
    return success;
  }

  // Verify OTP
  Future<bool> verifyOtp() async {
    final phone = _phoneController.text;
    final otp = _otpController.text;
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    await AuthApi.verifyOtp(phone, otp);
    bool success = otp.length == 6;

    _isLoading = false;
    if (!success) {
      _errorMessage = "Invalid OTP. Please try again.";
    } else {
      _errorMessage = "OTP verified successfully.";
      _phoneController.clear();
      _otpController.clear();
    }
    notifyListeners();
    return success;
  }
}
