import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart"
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
          mutations: {RemoveMutation},
        builder: (context, _, __){
        return "\$${_cart.totalprice}"
            .text
            .xl5
            .color(Colors.cyan).make();

        },
        ),
        ElevatedButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        "Buying Not Supported!!",
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),
        ))
        );
        },
        style: ElevatedButton.styleFrom(
        primary: Color(hexColor('#6699ff')),
        minimumSize: Size(100, 40),
        ),
        child: Text(
        "Buy",
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),
        )),
        ],
        ),
        );
        }
  }


class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {RemoveMutation}, // List of mutations to listen for
      builder: (context, _, __) {
        final CartModel _cart = (VxState.store as MyStore).cart;

        return _cart.products?.isEmpty ?? true
            ? Center(
          child: Text(
            "Nothing To Show",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
            : ListView.builder(
          itemCount: _cart.products?.length,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () =>
                  RemoveMutation(_cart.products[index]),
            ),
            title: Text(_cart.products[index].name),
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

