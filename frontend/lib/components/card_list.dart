import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/6,
          alignment: Alignment.center,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(radius: 25,child: Icon(Icons.person),),
                title: Text("SHUBHAM SINGH",),
                subtitle: Text("Hello Shubham"),
                trailing: Text("18:40",style: TextStyle(fontSize: 19),),
              ),
              Divider(
                thickness: 1,
              )
            ],
          )

        ),

    );
  }
}
