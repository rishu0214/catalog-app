import 'package:flutter/material.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Image.network(
        image,
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
