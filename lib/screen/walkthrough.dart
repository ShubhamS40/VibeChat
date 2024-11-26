import 'package:flutter/material.dart';
import 'package:vibechat/components/button.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 247, 247, 247)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/walkthrough.png',
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Text(
                  "Connect easily with your family and friends over countries",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 30,
            ),
            Text("Terms & Privacy Policy"),
            Button(text: "Start Messaging")
          ],
        ),
      )),
    );
  }
}
