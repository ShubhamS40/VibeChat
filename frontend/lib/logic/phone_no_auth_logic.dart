import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
class ApiService {
  final String apiUrl = "http://localhost:2000";

  Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
    try {
      final response = await http.post(Uri.parse('$apiUrl/api/auth/send-otp'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"phoneNumber": phoneNumber}));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      else {
        throw Exception("Failed to send OTP");
      }
    }
    catch (e) {
      throw Exception("Error: $e");
    }
  }


  Future<Map<String, dynamic>> verifyOtp(String otp, String phoneNumber, String token) async {
    try {
      final response = await http.post(
        Uri.parse("$apiUrl/api/auth/verify-otp"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "otp": otp,
          "phoneNumber": phoneNumber,
          "token": token, // Include the verification token here
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to verify OTP");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

}
