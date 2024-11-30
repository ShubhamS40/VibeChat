import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vibechat/components/button.dart';
import 'package:vibechat/screen/userdetail.dart';

class Verification2 extends StatefulWidget {
  final String country_code;
  final String mobile_number;
  const Verification2({super.key,required this.country_code,required this.mobile_number});


  @override
  State<Verification2> createState() => _Verification2State();
}

class _Verification2State extends State<Verification2> {
  String otp="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter Code",style:Theme.of(context).textTheme.headlineMedium),
          Container(
              width: MediaQuery.of(context).size.width/1,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(


              ),
              child: Text("We have sent you an SMS with the code to ${widget.country_code} ${widget.mobile_number} ",style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,)),

          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width/1.3,
            decoration: BoxDecoration(

            ),
            child: Expanded(
              child: PinCodeTextField(
                appContext: context,
                length: 6, // Number of OTP digits
                onChanged: (value) {
                  setState(() {
                  otp=value;
                  });
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
              ),
            ),
          ),
          Text("Resend Code",style: TextStyle(color: Color(0xF0002DE3)),),
          SizedBox(height: 20,),
          Button(text: "Submit",onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Userdetail()));
          },),

        ],
      ),
      )
    );
  }
}
