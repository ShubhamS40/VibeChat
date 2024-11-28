import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final dynamic onTap;
  const Button({super.key, required this.text, this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width/1.2,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xF0002DE3)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
