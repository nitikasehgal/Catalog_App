import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  static const routename = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cartModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
            builder: (context, MyStore, _) {
              return "\$${_cart.totalprice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
            mutations: {RemoveMutation}),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Buying not supported yet!")));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.buttonColor)),
                child: "Buy".text.white.make())
            .w32(context),
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return _cart.items.isEmpty
        ? Center(
            child: Text(
            "No items added to Card yet!",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
          ))
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                    // setState(() {});
                  },
                ),
                title: Text(_cart.items[index].name!),
              );
            },
            itemCount: _cart.items.length,
          );
  }
}
