import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://localhost:2000";
  // Store the token here after sendOtp call

  // Function to send OTP and store the token
  Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/api/auth/send-otp'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"phoneNumber": phoneNumber}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
      // Store the token from the response
        return data;            // Return the response data
      } else {
        throw Exception("Failed to send OTP. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Function to verify OTP using the stored token
  Future<Map<String, dynamic>?> verifyOtp(String otp, String phoneNumber, String token) async {
    final url = Uri.parse('$apiUrl/api/auth/verify-otp'); // Endpoint for verifying OTP

    try {
      // Sanitize the token to remove any extra quotes
      final cleanToken = token.replaceAll('"', '');

      final requestBody = {
        'otp': otp,
        'phoneNumber': phoneNumber,
        'token': cleanToken,
      };

      // Debugging-friendly print statement
      print("Request Body: ${jsonEncode(requestBody)}");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Successful response
      } else {
        print('Error ${response.statusCode}: ${response.body}');
        return {'message': 'Failed to verify OTP: ${response.statusCode}'};
      }
    } catch (e) {
      print('API Error: $e');
      return null;
    }
  }


}
