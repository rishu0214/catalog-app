import 'package:login_page/core/store.dart';
import 'package:login_page/models/design.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{


   late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
  
  List<Item> get products => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalprice =>
      products.fold(0, (total, current) => total + current.price);


}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }

}