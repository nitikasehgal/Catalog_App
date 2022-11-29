import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration: BoxDecoration(color: Colors.white),
                  margin: EdgeInsets.zero,
                  accountEmail: Text(
                    "nitikasehgal0602@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountName: Text("Nitika Sehgal",
                      style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/nits.jpeg'),
                  ),
                )),
            ListTile(
              title: Text("Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              leading: Icon(CupertinoIcons.home),
              iconColor: Colors.white,
            ),
            ListTile(
              title: Text("Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              leading: Icon(CupertinoIcons.profile_circled),
              iconColor: Colors.white,
            ),
            ListTile(
              title: Text("Mail",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              leading: Icon(CupertinoIcons.mail),
              iconColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
