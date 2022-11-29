import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/screens/homeDetail_page.dart';
import 'package:catalog_app/screens/home_screen.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return Vx.isWeb
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeDetailScreen(
                        catalogItem: catalog,
                      );
                    }));
                  },
                  child: CatalogItem(catalog));
            },
            itemCount: CatalogModel.items.length,
          )
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeDetailScreen(
                        catalogItem: catalog,
                      );
                    }));
                  },
                  child: CatalogItem(catalog));
            },
            itemCount: CatalogModel.items.length,
          );
  }
}
