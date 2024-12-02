import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vibechat/components/button.dart';
import 'package:vibechat/screen/chat.dart';

class Userdetail extends StatefulWidget {
  const Userdetail({super.key});

  @override
  State<Userdetail> createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {

  TextEditingController fname =TextEditingController();
  TextEditingController lname =TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void saveName(){
    firestore.collection('user').add({'first_name':fname.text,'last_name':lname.text}).then((onValue)=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data insert Sucessfully")))).catchError((error)=>print(error));
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 50,child: Icon(Icons.person,size: 50,)),
                  SizedBox(height: 20,),
                  TextField(
                    controller: fname,
                    decoration: InputDecoration(

                      hintText: "First Name (Required)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: lname,
                    decoration: InputDecoration(

                      hintText: "Last Name (Required)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                  ),
                  SizedBox(height: 60,),
                  Button(text: "Save",onTap: (){
                    saveName();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatscreen()));
                  },)
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
