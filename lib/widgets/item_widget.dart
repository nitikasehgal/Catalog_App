import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  ItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("Iphone 12 clicked");
        },
        leading: Image.network(item.image!),
        title: Text(item.name!),
        subtitle: Text(item.desc!),
        trailing: Text(
          '\$${item.price.toString()}',
          textScaleFactor: 1.4,
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
