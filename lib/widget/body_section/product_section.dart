// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop/Product/product_list.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({Key? key}) : super(key: key);

  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
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

  List<dynamic> subcategory = [
    ['All', 'Top Wear', 'Bottom Wear', 'Foot Wear'],
    ['All', 'Top Wear', 'Bottom Wear', 'Foot Wear'],
    ['All', 'Top Wear', 'Bottom Wear', 'Foot Wear'],
    ['All', 'Sofa Set', 'Chair & Table', 'TV Table'],
    ['All', 'Mobile Phone', 'Tablet', 'LED Tv', 'Watch', 'Ac / Fridge'],
    ['All', 'Sports Wear', 'Foot Wear', 'Material', 'Sport Shoes', 'Watch'],
  ];
  static late String main;
  static late List sub;

  Stream<QuerySnapshot<Object?>> cateStream(String cate) {
    final Stream<QuerySnapshot> menstream =
        FirebaseFirestore.instance.collection(cate).snapshots();
    return menstream;
  }

  BoxDecoration myDec() {
    return BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(7));
  }

  String showname(var n) {
    String name = '';
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
                    InkWell(
                      onTap: () {
                        setState(() async {
                          main = category[i];
                          sub = subcategory[i];
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.of(context).pop();
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductList(maincat: main, subcat: sub),
                              ));
                        });
                      },
                      child: Container(
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
                          child: SizedBox(
                            height: 250,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
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
