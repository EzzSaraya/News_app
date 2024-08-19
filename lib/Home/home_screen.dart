import 'package:flutter/material.dart';
import 'package:newss_app/appcolors.dart';

class HomeScreen extends StatelessWidget{
 static String routename='home_screen';
  @override
  Widget build(BuildContext context) {
 return Stack(
   children: [Container(color: Appcolors.WhiteColor,child: Image.asset("assets/images/pattern_background.png",
       height: double.infinity,
       width: double.infinity,
       fit: BoxFit.fill
   ),

     ),
    Scaffold(
     backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Appcolors.GreenColor,centerTitle: true,title: Text("News App"),
      ),
    )
   ]

 );



  }

}