import 'package:flutter/material.dart';
import 'package:newss_app/Home/home_screen.dart';
import 'package:newss_app/mythemedata.dart';

import '';
void main(){
  runApp(News_app());
}

class News_app extends StatelessWidget{



  @override
  Widget build(BuildContext context




  ) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: Mythemedata.LightTheme,
      initialRoute:HomeScreen.routename,
      routes: {
    HomeScreen.routename:(context)=> HomeScreen()
    },

    );
  }
  }


