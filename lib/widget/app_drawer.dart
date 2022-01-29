// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop/widget/drawer/when_login.dart';
import 'package:quick_shop/widget/drawer/without_login.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  _MyAppDrawerState createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  Color c2 = Color.fromARGB(255, 189, 173, 252);
  Color c1 = Color.fromARGB(255, 0, 229, 255);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 115,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                      colors: [c1, c2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(
                        "Ravi Panchal",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "ravi@gmail.com",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.orange[100],
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ),
            ),
          ),
          //All Menu Is Start From here
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: WithOutLogin(),
            ),
          )
        ],
      ),
    );
  }
}
