import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/screens/home_screen.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  CatalogItem(this.catalog);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()), child: CatalogImage(catalog.image!)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name!.text.lg.color(context.accentColor).bold.make(),
          catalog.desc!.text
              .textStyle(context.captionStyle)
              .color(MyTheme.darkBluishColor)
              .make(),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              '\$${catalog.price!}'.text.bold.xl.make(),
              AddToCart(catalog),
            ],
          ).pOnly(right: 8)
        ],
      ).p(context.isMobile ? 0 : 16))
    ];
    return VxBox(
            child: !context.isMobile
                ? Column(
                    children: children2,
                  )
                : Row(
                    children: children2,
                  ))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py(16);
  }
}
