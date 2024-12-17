import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Replymessagecard extends StatelessWidget {
  const Replymessagecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width/2.5,

     
        child: Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Text("Hi Shubhamdjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjddddddddd"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text("10:15",style: TextStyle(fontSize: 10),),
                    SizedBox(width: 5,),
                    Icon(Icons.check_outlined,size: 15,)
                  ],
                )
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}
