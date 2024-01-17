import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 52,
            color: Color(hexColor('#6699ff')),
          ),
        ),
        Text("Trending Prodcts",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}

