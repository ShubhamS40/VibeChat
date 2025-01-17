import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibechat/firebase_options.dart';
import 'package:vibechat/screen/home.dart';
import 'package:vibechat/screen/individual.dart';
import 'package:vibechat/screen/selectcontact.dart';
import 'package:vibechat/screen/userdetail.dart';
import 'package:vibechat/authentication/verification.dart';
import 'package:vibechat/authentication/verification2.dart';
import 'package:vibechat/screen/walkthrough.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          //Text Theme
         appBarTheme: AppBarTheme(
           color: Color(0xF0002DE3),
           titleTextStyle: TextStyle(color: Colors.white),
             iconTheme: IconThemeData(
             color: Colors.white
         )
         ),
          textTheme: TextTheme(
              headlineMedium: TextStyle(
                  color: Color(0xF00F1828),
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
              headlineSmall: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w100)),

          // This is the theme of your application.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Selectcontact());
  }
}
