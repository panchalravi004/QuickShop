// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithOutLogin extends StatefulWidget {
  const WithOutLogin({Key? key}) : super(key: key);

  @override
  _WithOutLoginState createState() => _WithOutLoginState();
}

class _WithOutLoginState extends State<WithOutLogin> {

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
            Icons.share,
            color: Colors.black,
            size: 20,
          ),
          title: Text("Share",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.red)),
        ),
        ListTile(
          leading: Icon(
            Icons.developer_mode_rounded,
            color: Colors.black,
            size: 20,
          ),
          title: Text("About Dev.",
              textScaleFactor: 1.1, style: TextStyle(color: Colors.black)),
        ),
        SizedBox(height: 200,),
        Container(
          width: 110,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
              child: Text("Sign up",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 30,),
        Container(
          width: 110,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.red[500],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
              child: Text("Sign in",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
        )
      ],
    );
  }
}
