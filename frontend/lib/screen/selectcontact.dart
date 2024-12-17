import 'package:flutter/material.dart';
import 'package:vibechat/components/contact_card.dart';

class Selectcontact extends StatefulWidget {
  const Selectcontact({super.key});

  @override
  State<Selectcontact> createState() => _SelectcontactState();
}

class _SelectcontactState extends State<Selectcontact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Select Contact"),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 25),child: Icon(Icons.search_rounded)),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
                PopupMenuItem(child: Text("Messages")),
              PopupMenuItem(child: Text("Chats"))
            ];
          }

          )
        ],
      ),


      body: ListView(
        children: [
          ContactCard()
        ],
      ),

    );
  }
}
