// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Enter Username",
              labelText: "Username",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Container(
              width: 110,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(35)),
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
          Padding(
            padding: const EdgeInsets.only(left:180),
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
    );
  }
}
