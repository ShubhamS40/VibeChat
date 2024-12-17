import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ownmessagecard extends StatelessWidget {
  const Ownmessagecard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: BoxConstraints(
      maxWidth: 200,


    ),

    child: Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 280,
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
        child: Card(

          color: Colors.blue,
            elevation: 1,
          child: Stack(
            children: [
              Padding(padding:EdgeInsets.symmetric(vertical: 5,horizontal: 25),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HElldssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssso"),
                 Container(
                   color: Colors.red,
                   width: 100,

                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("10:15",style: TextStyle(fontSize: 10),),
                      SizedBox(width: 5,),
                      Icon(Icons.check_outlined,size: 15,)
                    ],
                  ),
                ],
              ),),

            ],
          ),
        ),
      ),
    ),
    );
  }
}
