// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quick_shop/pages/signin.dart';
import 'package:quick_shop/pages/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static bool signin = true;
  static bool signup = false;
  static Widget currentPage = SignIn();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 45,
                    child: Center(
                        child: Text(
                      "QUICK",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 3),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        )),
                  ),
                  Container(
                    width: 110,
                    height: 45,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "SHOP",
                        style: TextStyle(
                            color: Colors.red[600],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: 280,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          signin = true;
                          signup = false;
                          currentPage = SignIn();
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: signin ? Colors.blueAccent[400] : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                            child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: signin ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        setState(() {
                          signin = false;
                          signup = true;
                          currentPage = SignUp();
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: signup ? Colors.blueAccent[400] : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: signup ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 460,
                //color: Colors.amber,
                child: currentPage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 332),
              child: Container(
                width: 80,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                child: Center(
                  child: Text("Skip",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                "By Signing up or login in you agree with our",
                style: TextStyle(fontSize: 13),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Terms and conditions ",
                  style: TextStyle(color: Colors.red,fontSize: 13),
                ),
                Text(" and "),
                Text(
                  " Legal Policy",
                  style: TextStyle(color: Colors.red,fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
