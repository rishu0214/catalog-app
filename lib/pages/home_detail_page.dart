import 'package:flutter/material.dart';
import 'package:login_page/models/design.dart';
import 'package:login_page/pages/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Text("\$${catalog.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.purple[800],
              ),
            ),
            AddToCart(catalog: catalog)
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),

              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image,
                  height: 300,
                  ),
              ),
            ),

            Expanded(child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Colors.white,
                height: 400,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(catalog.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35,
                        ),
                      ),
                      Center(
                        child: Text(catalog.desc,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.5,
      h + 50,
      w,
      h,
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip (CustomClipper<Path> oldClipper){
    return false;
  }
}