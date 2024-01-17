import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.cyan,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      )
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    cardColor: Colors.black,
      canvasColor: Color(hexColor('#8EC191')),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      )
  );

}

int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}