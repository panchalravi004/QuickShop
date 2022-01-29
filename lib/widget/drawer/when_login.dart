// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhenLogin extends StatefulWidget {
  const WhenLogin({Key? key}) : super(key: key);

  @override
  _WhenLoginState createState() => _WhenLoginState();
}

class _WhenLoginState extends State<WhenLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Home",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.person_fill,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Profile",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.red)),
        ),
        ListTile(
          leading: Icon(
            Icons.category_outlined,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Category",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.bag,
            color: Colors.black,
            size: 20,
          ),
          title: Text("My Order's",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.heart,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Wishlist",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            Icons.sell_outlined,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Sell On QuickShop",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.red)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.share_up,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Refer And Earn",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.red)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.bell,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Notification's",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Logout",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.red)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.settings,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Settings",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            Icons.help_outline,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Help ?",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer_outlined,
            color: Colors.black,
            size: 20,
          ),
          title: Text("FAQs",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        ListTile(
          leading: Icon(
            Icons.share,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Share",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
