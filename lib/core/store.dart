import 'package:login_page/models/cart.dart';
import 'package:login_page/models/design.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

 MyStore(){
  catalog = CatalogModel();
  cart = CartModel();
  cart.catalog = catalog;
}
}