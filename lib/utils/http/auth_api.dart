import 'package:lilac_task/utils/http/http_service.dart';

class AuthApi {
  static const String baseUrl = "https://test.myfliqapp.com/api/v1";

  // Send OTP
  static Future<bool> sendOtp(String phone) async {
    final url = "$baseUrl/auth/registration-otp-codes/actions/phone/send-otp";

    final body = {
      "data": {
        "type": "registration_otp_codes",
        "attributes": {"phone": "+919090909090"}
      }
    };

    final response = await HttpService.postRequest(url, body);

    return response.isNotEmpty;
  }

  // Verify OTP
  static Future<bool> verifyOtp(String phone, String otp) async {
    final url = "$baseUrl/auth/registration-otp-codes/actions/phone/verify-otp";

    final body = {
      "data": {
        "type": "registration_otp_codes",
        "attributes": {
          "phone": "+919090909090",
          "otp": 111111,
          "device_meta": {
            "type": "web",
            "name": "HP Pavilion 14-EP0068TU",
            "os": "Linux x86_64",
            "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
            "browser_version": "112.0.2",
            "user_agent":
                "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
            "screen_resolution": "1600x900",
            "language": "en-GB"
          }
        }
      }
    };

    final response = await HttpService.postRequest(url, body);

    return response.isNotEmpty;
  }
}
