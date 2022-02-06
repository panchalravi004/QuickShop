// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenSection extends StatefulWidget {
  const MenSection({Key? key}) : super(key: key);

  @override
  _MenSectionState createState() => _MenSectionState();
}

class _MenSectionState extends State<MenSection> {
  final Stream<QuerySnapshot> menstream =
      FirebaseFirestore.instance.collection('men').snapshots();

  var c1 = Color.fromARGB(255, 0, 229, 255);
  var c2 = Color(0xFF7E57C2);

  var c3 = Colors.lightGreenAccent;
  var c4 = Colors.lightBlueAccent;

  var c5 = Colors.yellow;
  var c6 = Colors.lightGreenAccent;

  var c11 = Color.fromARGB(255, 189, 173, 252);
  var c12 = Color(0xFF29B6F6);

  final List category = ['men', 'women', 'baby'];
  final List title = ['Men Wear', 'Women Wear', 'Baby Wear'];

  Stream<QuerySnapshot<Object?>> cateStream(String cate) {
    final Stream<QuerySnapshot> menstream =
        FirebaseFirestore.instance.collection(cate).snapshots();
    return menstream;
  }

  BoxDecoration myDec() {
    return BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(7));
  }

  String name = '';
  String showname(var n) {
    if (n.toString().length > 15) {
      name = n[0] +
          n[1] +
          n[2] +
          n[3] +
          n[4] +
          n[5] +
          n[6] +
          n[7] +
          n[8] +
          n[9] +
          n[10] +
          n[11] +
          n[12] +
          n[13] +
          n[14] +
          n[15] +
          '...';
      return name;
    }
    return n;
  }

  var one;
  var two;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < category.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Container(
              height: 310,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        title[i],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 165),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[700],
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Show All',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ]),
                  StreamBuilder(
                    stream: cateStream(category[i]),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Something Wrong !');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      //get data
                      final List mendata = [];
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        mendata.add(a);
                      }).toList();
                      // print(mendata);

                      if (i == 0) {
                        one = c1;
                        two = c2;
                      } else if (i == 1) {
                        one = c3;
                        two = c4;
                      } else if (i == 2) {
                        two = c5;
                      }
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 265,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 5),
                                    blurRadius: 15,
                                    spreadRadius: 0)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [one, two],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 240,
                                height: 250,
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 115,
                                          height: 120,
                                          decoration: myDec(),
                                          child: Column(
                                            children: [
                                              Image(
                                                  height: 80,
                                                  image: NetworkImage(
                                                      mendata[0]['img'])),
                                              Text(showname(mendata[0]['name']),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Rs.' +
                                                          mendata[0]
                                                              ['saleprice'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  SizedBox(width: 10),
                                                  Text(mendata[0]['mrp'],
                                                      style: TextStyle(
                                                          fontSize: 10))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          width: 115,
                                          height: 120,
                                          decoration: myDec(),
                                          child: Column(
                                            children: [
                                              Image(
                                                  height: 80,
                                                  image: NetworkImage(
                                                      mendata[1]['img'])),
                                              Text(showname(mendata[1]['name']),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Rs.' +
                                                          mendata[1]
                                                              ['saleprice'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  SizedBox(width: 10),
                                                  Text(mendata[1]['mrp'],
                                                      style: TextStyle(
                                                          fontSize: 10))
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 115,
                                          height: 120,
                                          decoration: myDec(),
                                          child: Column(
                                            children: [
                                              Image(
                                                  height: 80,
                                                  image: NetworkImage(
                                                      mendata[2]['img'])),
                                              Text(showname(mendata[2]['name']),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Rs.' +
                                                          mendata[2]
                                                              ['saleprice'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  SizedBox(width: 10),
                                                  Text(mendata[2]['mrp'],
                                                      style: TextStyle(
                                                          fontSize: 10))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          width: 115,
                                          height: 120,
                                          decoration: myDec(),
                                          child: Column(
                                            children: [
                                              Image(
                                                  height: 80,
                                                  image: NetworkImage(
                                                      mendata[3]['img'])),
                                              Text(showname(mendata[3]['name']),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Rs.' +
                                                          mendata[3]
                                                              ['saleprice'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  SizedBox(width: 10),
                                                  Text(mendata[3]['mrp'],
                                                      style: TextStyle(
                                                          fontSize: 10))
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 125,
                                height: 250,
                                decoration: myDec(),
                                child: Column(
                                  children: [
                                    Image(
                                        height: 155,
                                        image: NetworkImage(mendata[4]['img'])),
                                    SizedBox(height: 5),
                                    Text(showname(mendata[4]['name']),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 5),
                                    Text(mendata[4]['salername'],
                                        style: TextStyle(fontSize: 10)),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Rs.' + mendata[4]['saleprice'],
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(width: 10),
                                        Text(mendata[4]['mrp'],
                                            style: TextStyle(fontSize: 10))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }
}
