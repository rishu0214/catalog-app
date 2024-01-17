import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/design.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({
    super.key, required this.catalog,
  });


  @override
  Widget build(BuildContext context) {
    return VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __){
      final CartModel _cart = (VxState.store as MyStore).cart;

      bool isAdded = _cart.products.contains(catalog);

      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(hexColor('#6699ff')),
        ),
        onPressed: () {
          if (!isAdded) {
            // Update the state using the mutation
            AddMutation(catalog);
          }
        },
        child: isAdded
            ? Icon(Icons.done)
            : Icon(
          CupertinoIcons.cart_badge_plus,
          color: Colors.white,
          size: 24,
        ),
      );
        },
    );
  }
}

int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}