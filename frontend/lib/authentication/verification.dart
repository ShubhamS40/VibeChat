import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:vibechat/components/button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:vibechat/authentication/verification2.dart';
import 'package:vibechat/logic/auth_logic.dart';
import 'package:http/http.dart';


class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String country_flag = "IN";
  String country_code = "+91"; // Default country code
  TextEditingController numberInput = TextEditingController();
  ApiService apiService =ApiService();

  void sendotp() async {
    final String phoneNumber = country_code + numberInput.text;
    print(phoneNumber);

    try {
      // Call the API service to send OTP
      Map<String, dynamic> response = await apiService.sendOtp(phoneNumber);

      // Check if the OTP was sent successfully
      if (response['message'] == 'OTP sent successfully') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully!')),
        );
        var decodedToken = Jwt.parseJwt(response['token']);
        print(decodedToken);  // This will show the token's payload

        // Optionally, navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Verification2(
              verificationId: json.encode(response['token']),
              country_code: country_code,
              mobile_number: phoneNumber,
            ),
          ),
        );
      } else {
        // Show error if OTP sending failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP. Please try again!')),
        );
      }
    } catch (error) {
      // Show error Snackbar if any exception is thrown
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
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
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              onTap: (){sendotp();},
            ),
          ],
        ),
      ),
    );
  }
}
