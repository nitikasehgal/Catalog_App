import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  CatalogModel? _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog!;
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog!.getbyid(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price!);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cartModel._itemIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cartModel._itemIds.remove(item.id!);
  }
}
