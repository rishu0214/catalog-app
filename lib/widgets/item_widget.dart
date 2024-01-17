import 'package:flutter/material.dart';
import 'package:login_page/models/design.dart';

class ItemWidget extends StatelessWidget {

 final Item products;

  const ItemWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: Image.network(products.image),
      title: Text(products.name),
      subtitle: Text(products.desc),
      trailing: Text("\$${products.price}"),
    );
  }
}
