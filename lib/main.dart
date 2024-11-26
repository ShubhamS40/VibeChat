import 'package:flutter/material.dart';
import 'package:vibechat/screen/walkthrough.dart';

void main() {
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

          textTheme: TextTheme(
              headlineMedium: TextStyle(
                  color: Color(0xF00F1828),
                  fontSize: 32,
                  fontWeight: FontWeight.w500),
              headlineSmall: TextStyle(fontSize: 10, color: Colors.black)),

          // This is the theme of your application.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Walkthrough());
  }
}
