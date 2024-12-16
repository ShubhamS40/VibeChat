import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vibechat/components/button.dart';
import 'package:vibechat/logic/user_logic.dart';
import 'package:vibechat/screen/home.dart';

class Userdetail extends StatefulWidget {
 final String user_id;
  const Userdetail({super.key,required this.user_id});


  @override
  State<Userdetail> createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {

  TextEditingController fname =TextEditingController();
  TextEditingController lname =TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Update_User update_user = Update_User();

  void saveName() async{

    print("Hello Shubham Userid : ${fname.text} ${lname.text}  ${widget.user_id}");
    final response=  await update_user.updateUser(widget.user_id, fname.text, lname.text);
    print("Final Response form User Deatil Page $response");
    if(response != null){
      if(response["message"] == 'User updated successfully'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Detail Add success Fully")));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
      }else{
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed To Add User Detail ${response['message']}")));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No response from server')),
      );
    }
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
                  Button(text: "Save",onTap: (){saveName(); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Save Button Tap")));},)
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
