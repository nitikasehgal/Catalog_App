import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/screens/cart_screen.dart';
import 'package:catalog_app/screens/homeDetail_page.dart';
import 'package:catalog_app/screens/home_screen.dart';
import 'package:catalog_app/screens/login_Screen.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Catalog",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: MyTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        LoginScreen.routename: (context) => LoginScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        CartScreen.routename: (context) => CartScreen(),
      },
    );
  }
}
