import 'package:flutter/material.dart';
import 'package:vibechat/screen/individual.dart';

class CardList extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardList({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Individualpage(name: title,)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(subtitle),
              trailing: Text(
                "18:40",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
