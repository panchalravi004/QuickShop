// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_label, avoid_web_libraries_in_flutter, unused_local_variable, deprecated_member_use

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  Color c1 = Color.fromARGB(255, 189, 173, 252);
  Color c2 = Color.fromARGB(255, 0, 229, 255);

  var user = FirebaseAuth.instance.currentUser;

  final fnamecontrol = TextEditingController();
  final lnamecontrol = TextEditingController();
  final mobilecontrol = TextEditingController();
  final pincontrol = TextEditingController();
  final reffercontrol = TextEditingController();

  setData() {
    var user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((data) {
      setState(() {
        fnamecontrol.text = data['fname'].toString();
        lnamecontrol.text = data['lname'].toString();
        mobilecontrol.text = data['mobile'].toString();
        pincontrol.text = data['pin'].toString();
        reffercontrol.text = data['reffer'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  //Select image from gallery
  late File image;
  selectImage() async {
    final img = ImagePicker();
    final imageFile = await img.getImage(source: ImageSource.gallery);
    if (imageFile != null) {
      image = imageFile.path.toString() as File;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              gradient: LinearGradient(
                  colors: [c2, c1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 35,
          ),
          child: Row(
            children: [
              Text(
                "Update Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: IconButton(
                  onPressed: () {
                    selectImage();
                  },
                  icon: Icon(CupertinoIcons.camera_circle_fill),
                  iconSize: 35,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Container(
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [c2, Colors.blue],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0,
                            )
                          ],
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: Center(
                          child: Text(
                            "Useremail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 180,
                        height: 45,
                        child: Center(
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return LinearProgressIndicator();
                              }
                              return Text(
                                snapshot.data['email'],
                                style: TextStyle(fontSize: 18),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: Center(
                          child: Text(
                            "First Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 180,
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: fnamecontrol,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: Center(
                          child: Text(
                            "Last Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 180,
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: lnamecontrol,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: Center(
                          child: Text(
                            "Mobile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 180,
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: mobilecontrol,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: Center(
                          child: Text(
                            "PinCode",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 180,
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: pincontrol,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: Center(
                          child: Text(
                            "Refferal !",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 180,
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: reffercontrol,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          selectImage();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.amberAccent,
                                    Colors.lightGreen
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
