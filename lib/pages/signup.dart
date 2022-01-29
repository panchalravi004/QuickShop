// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, non_constant_identifier_names, unused_local_variable, invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  final fnamecontrol = TextEditingController();
  final lnamecontrol = TextEditingController();
  final emailcontrol = TextEditingController();
  final mobilecontrol = TextEditingController();
  final pwdcontrol = TextEditingController();
  final cpwdcontrol = TextEditingController();
  final pincontrol = TextEditingController();
  final reffercontrol = TextEditingController();

  var fname = "";
  var lname = "";
  var email = "";
  var mobile = "";
  var pwd = "";
  var cpwd = "";
  var pin = "";
  var reffer = "";
//show alert dialog box
  String msgs = "Sign Up Successfully";
  String err = "Faild to sign up";

  Future<void> msg(String msg) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Thank You"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(msg)],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
          ],
        );
      },
    );
  }

//Register User
//addding student in firestore database like this   -----doc(email)----- for custom document name
//CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser() async {
    if (pwd == cpwd) {
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
                .createUserWithEmailAndPassword(email: email, password: pwd))
            .user;
        FirebaseFirestore.instance
            .collection("users")
            .doc(currentuser!.uid)
            .set({
          'fname': fname,
          'lname': lname,
          'email': email,
          'mobile': mobile,
          'pwd': pwd,
          'cpwd': cpwd,
          'pin': pin,
          'reffer': reffer
        }).then((value) {
          Navigator.of(context).pop();
          msg(msgs);
        })
        .catchError((error) => msg(err + " $error"));
        }
        catch (e) {
          print(e);
        }
    }
  }

//clear all field
  clearText() {
    fnamecontrol.clear();
    lnamecontrol.clear();
    emailcontrol.clear();
    mobilecontrol.clear();
    pwdcontrol.clear();
    cpwdcontrol.clear();
    pincontrol.clear();
    reffercontrol.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      child: TextFormField(
                        controller: fnamecontrol,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter First Name",
                          labelText: "First Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter First Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 180,
                      child: TextFormField(
                        controller: lnamecontrol,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter Last Name",
                          labelText: "Last Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Last Name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
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
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: mobilecontrol,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter Your Mobile Number",
                    labelText: "Your Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Mobile Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      child: TextFormField(
                        obscureText: true,
                        controller: pwdcontrol,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 180,
                      child: TextFormField(
                        obscureText: true,
                        controller: cpwdcontrol,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Confirm Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Confirm Password';
                          } else if (value != pwdcontrol.text) {
                            return 'Password Does Not Match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      child: TextFormField(
                        controller: pincontrol,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter Pin Code",
                          labelText: "Pin Code",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Pin Code';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 180,
                      child: TextFormField(
                        controller: reffercontrol,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter Referral Code (Optional)",
                          labelText: "Referral Code ?",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        fname = fnamecontrol.text;
                        lname = lnamecontrol.text;
                        email = emailcontrol.text;
                        mobile = mobilecontrol.text;
                        pwd = pwdcontrol.text;
                        cpwd = cpwdcontrol.text;
                        pin = pincontrol.text;
                        reffer = reffercontrol.text;
                        addUser();
                        clearText();
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
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
