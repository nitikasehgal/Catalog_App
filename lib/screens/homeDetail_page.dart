// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';

class HomeDetailScreen extends StatelessWidget {
  static const routename = '/home-detail';
  final Item catalogItem;
  const HomeDetailScreen({
    Key? key,
    required this.catalogItem,
  })  : assert(catalogItem != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalogItem.price!}'.text.bold.xl4.red800.make(),
            AddToCart(catalogItem).wh(120, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
                    tag: Key(catalogItem.id.toString()),
                    child: Image.network(catalogItem.image!))
                .p16()
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(children: [
                  catalogItem.name!.text.xl3
                      .color(context.accentColor)
                      .bold
                      .make(),
                  catalogItem.desc!.text
                      .textStyle(context.captionStyle)
                      .color(MyTheme.darkBluishColor)
                      .xl
                      .make(),
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ornare posuere enim non interdum. Praesent quis rhoncus ipsum, vitae faucibus nunc. Sed rhoncus felis ut dui pharetra, eget dictum odio interdum. Aenean elementum semper libero vitae imperdiet. Maecenas quis varius nulla. Pellentesque id interdum sem. Nulla id lorem lorem. Aenean.'
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p(context.isMobile ? 16 : 0)
                ]).py64(),
              ),
            )),
          ])),
    );
  }
}
