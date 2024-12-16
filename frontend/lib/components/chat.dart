import 'package:flutter/material.dart';
import 'package:vibechat/components/card_list.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<Map<String, String>> detail = [
    {"title": "Shubham", "subtitle": "Hi Hello"},
    {"title": "Manish", "subtitle": "Good Morning"},
    {"title": "Shubham", "subtitle": "Hi Hello"},
    {"title": "Manish", "subtitle": "Good Morning"},
    {"title": "Shubham", "subtitle": "Hi Hello"},
    {"title": "Manish", "subtitle": "Good Morning"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: detail.length,
        itemBuilder: (context, index) {
          return CardList(
            title: detail[index]["title"]!,
            subtitle: detail[index]["subtitle"]!,
          );
        },
      ),
    );
  }
}
