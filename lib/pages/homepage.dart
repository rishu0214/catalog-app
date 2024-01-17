import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/core/store.dart';
import 'package:login_page/models/cart.dart';
import 'dart:convert';
import 'package:login_page/models/design.dart';
import 'package:login_page/pages/home_widgets/catalog_list.dart';
import 'package:login_page/util/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_widgets/catalog_header.dart';


class homepage extends StatefulWidget {

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final designJson = await rootBundle.loadString("assets/files/design_c.json");
    final decodedData = jsonDecode(designJson);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
  setState(() {

  });
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, myroutes.cartroute),
          backgroundColor: Color(hexColor('#6699ff')),
          child: Icon(CupertinoIcons.cart,
          color: Colors.white,
          ),
        ).badge(color: Vx.green900, size: 20, count: _cart.products.length,
        textStyle: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.white
        )
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.products != null && CatalogModel.products!.isNotEmpty)
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: CatalogList(),
                    )
                )
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}









