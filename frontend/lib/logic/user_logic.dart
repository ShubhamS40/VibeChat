import 'dart:convert';

import 'package:http/http.dart' as http;
class Update_User{
  final apiUrl="http://localhost:2000";
  Future<Map<String,dynamic>> updateUser(String user_id,String FirstName,String LastName)async{
   try{
     final response=await http.put(Uri.parse("$apiUrl/api/update-user/$user_id"),body: json.encode({FirstName,LastName}),
         headers: {"Content-type":"application/json"});


     if(response.statusCode==200) {
       final data = json.decode(response.body);
       return data;
     }else{
       throw Exception("Failed to Update the User Detail : ${response.statusCode}");
     }
   }catch(error){
     throw Exception("Catch Part Execuited $error");
   }
  }




}