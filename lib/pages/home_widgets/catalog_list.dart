import 'package:flutter/cupertino.dart';
import 'package:login_page/models/cart.dart';
import 'package:login_page/pages/home_detail_page.dart';
import '../../models/design.dart';
import '../homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.products.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.products[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog), )),
              child: CatalogItem(catalog: catalog));
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(color: Color(hexColor('#f5f5dc')),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(catalog.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(catalog.desc,
                  style: TextStyle(
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text("\$${catalog.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddToCart(catalog: catalog),
                  ],
                )
              ],
            )),
          ],
        ),

        height: 150,
        width: 200,
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