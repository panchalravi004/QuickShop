// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_field, avoid_print

//import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop/pages/signin.dart';
import 'package:quick_shop/widget/drawer/when_login.dart';
import 'package:quick_shop/widget/drawer/without_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  _MyAppDrawerState createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  Color c2 = Color.fromARGB(255, 189, 173, 252);
  Color c1 = Color.fromARGB(255, 0, 229, 255);

  bool userlogin = SignIn.userlogin;
  static String title = "SignUp / SignIn";
  static String subtitle = "Please Login To Know More";
  String username = "";
  String useremail = "";

  //for username
  String showusername() {
    var user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((data) {
      setState(() {
        username = data['fname'].toString() + " " + data['lname'].toString();
      });
    });
    return username;
  }

  // //for user email
  String showuseremail() {
    var user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((data) {
      setState(() {
        useremail = data['email'].toString();
      });
    });
    return useremail;
  }

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
                        userlogin ? showusername().toUpperCase(): title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            ),
                      ),
                      subtitle: Text(
                        userlogin ? showuseremail() : subtitle,
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
                        // child: CircleAvatar(
                        //   backgroundColor: Colors.transparent,
                        //   backgroundImage: NetworkImage(''),
                        // ),
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
              child: userlogin ? WhenLogin() : WithOutLogin(),
            ),
          )
        ],
      ),
    );
  }
}
