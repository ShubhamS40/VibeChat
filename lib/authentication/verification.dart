import 'package:flutter/material.dart';
import 'package:vibechat/components/button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:vibechat/authentication/verification2.dart';
import 'package:vibechat/logic/phone_no_auth_logic.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String country_flag = "IN";
  String country_code = "+91"; // Default country code
  final PhoneAuthService authService = PhoneAuthService();

  TextEditingController numberInput = TextEditingController();

  void onCodeSent(String verificationId) {
    // Navigate to the next screen after the OTP is sent
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Verification2(
          country_code: country_code,
          mobile_number: numberInput.text.trim(),
          verificationId: verificationId,
        ),
      ),
    );
  }

  void onError(String error) {
    // Log the detailed error
    print("OTP error details: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  }


  // Function to validate phone number
  bool isValidPhoneNumber() {
    String phoneNumber = numberInput.text.trim();

    // Check if the phone number is not empty and contains only numbers
    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      print("Phone number is invalid: $phoneNumber");
      return false;
    }

    // Check if the phone number is valid based on country code
    bool isNumeric = RegExp(r'^[0-9]+$').hasMatch(phoneNumber);
    if (!isNumeric) {
      print("Phone number contains non-numeric characters: $phoneNumber");
    }

    return isNumeric;
  }

  // Function to get the full phone number with country code
  String getFullPhoneNumber() {
    String fullPhone = '$country_code${numberInput.text.trim()}';
    print("Full phone number: $fullPhone"); // Debugging line
    return fullPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter Your Phone Number",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(1),
                    child: Text(
                      "Please confirm your country code and enter your phone number",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          setState(() {
                            country_code = "+${country.phoneCode}";
                            country_flag = country.flagEmoji;
                          });
                        },
                      );
                    },
                    child: Chip(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      label: Text("$country_flag $country_code"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: numberInput,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Button(
              text: "Continue",
              onTap: () {
                // Validate phone number before sending OTP
                if (isValidPhoneNumber()) {
                  String fullPhoneNumber = getFullPhoneNumber(); // Get full phone number with country code
                  // Send OTP and handle the response
                  authService.sendOtp(
                    phoneNumber: fullPhoneNumber, // Pass the full phone number
                    onCodeSent: onCodeSent,
                    onError: onError,
                  );
                } else {
                  // Show error message if phone number is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid phone number')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
