import 'package:flutter/material.dart';
import 'package:newss_app/appcolors.dart';

class Mythemedata{
  static final ThemeData LightTheme= ThemeData( primaryColor: Appcolors.GreenColor,
    appBarTheme: AppBarTheme(centerTitle: true,backgroundColor: Appcolors.GreenColor,shape:RoundedRectangleBorder(borderRadius:
    BorderRadius.only(bottomLeft:
    Radius.circular(45),bottomRight:
    Radius.circular(45)))),
    textTheme:
      TextTheme(
        titleLarge: TextStyle(
          color: Appcolors.WhiteColor,
          fontWeight: FontWeight.normal,
          fontSize: 22),
        titleMedium: TextStyle(color: Color(0xff42505C),
        fontSize: 14,
        fontWeight: FontWeight.w500),
        titleSmall: TextStyle(color:Appcolors.BlackColor,fontWeight: FontWeight.bold,fontSize: 24),
        bodySmall:  TextStyle(
          color: Appcolors.BlackColor,
          fontSize: 13,
          fontWeight: FontWeight.w400
        )



        )
      );


}

