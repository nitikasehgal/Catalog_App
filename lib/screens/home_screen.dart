import 'dart:convert';
import 'package:http/http.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/screens/cart_screen.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogjson = await rootBundle.loadString('assets/files/catalog.json');
    var jsonData = jsonDecode(catalogjson);
    var productsData = jsonData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((catalog) => Item.fromMap(catalog))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, MyStore, _) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routename);
              },
              backgroundColor: context.theme.buttonColor,
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            ).badge(
                color: Vx.gray200,
                size: 22,
                count: _cart.items.length,
                textStyle: TextStyle(
                    // fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold));
          }),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().py16()
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              )),
        ),
      ),
    );
  }
}
