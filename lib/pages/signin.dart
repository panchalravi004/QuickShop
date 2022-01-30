// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print, prefer_const_literals_to_create_immutables, unused_local_variable, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop/utils/routes.dart';

class SignIn extends StatefulWidget {
  static late bool userlogin = false;

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final emailcontrol = TextEditingController();
  final pwdcontrol = TextEditingController();

  static var email = "";
  var pwd = "";
  // bool userlogin = false;

//LOGIN USERS
  Future<void> signin() async {
    if (_formkey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        final currentuser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pwd));
        SignIn.userlogin = true;
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(MyRoutes.homeroutes);
      } catch (e) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something Wrong"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[Text(e.toString())],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
              ],
            );
          },
        );
        print(e);
      }
    }
  }

  clear() {
    emailcontrol.clear();
    pwdcontrol.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: emailcontrol,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                labelText: "Your Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Email';
                } else if (!value.contains('@')) {
                  return 'Enter Valid Email';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: TextFormField(
                controller: pwdcontrol,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Your Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      email = emailcontrol.text;
                      pwd = pwdcontrol.text;
                      signin();
                      clear();
                    });
                  }
                },
                child: Container(
                  width: 110,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: Container(
                width: 150,
                height: 30,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Forgot Password !",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
