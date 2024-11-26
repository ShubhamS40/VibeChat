import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 4, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xF0002DE3)),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }
}
