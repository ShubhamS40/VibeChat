import 'package:flutter/material.dart';
import 'package:vibechat/components/button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:vibechat/authentication/verification2.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
   String country_flag="IN";
   String country_code="+91";


   TextEditingController numberInput= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/1.1,
        decoration: BoxDecoration(



        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center
,         children: [
             Container(
               height: MediaQuery.of(context).size.height/5,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(

               ),
               child:   Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Enter Your Phone Number",style:Theme.of(context).textTheme.headlineMedium),
                   Container(
                       width: MediaQuery.of(context).size.width/1.5,
                       margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(


                        ),
                       child: Text("Please confirm your country code and enter your phone number",style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,)),


                 ],
               ),
             ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: (){showCountryPicker(context: context,showPhoneCode: true, onSelect: (Country country){
                  setState(() {
                    country_code="+${country.phoneCode}";
                    country_flag=country.flagEmoji;

                  });
                });},child: Chip(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),label: Text("$country_flag $country_code"))),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width/1.8,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: numberInput,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                )

              ],
            ),),
           SizedBox(height: 50),
            Button(text: "Continue",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Verification2(country_code: country_code,mobile_number: numberInput.text,)));

            },)


          ],
        ),
      ),
    );
  }
}
