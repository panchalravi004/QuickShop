// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final Map product;
  final String maincat;
  const ProductView({Key? key, required this.product, required this.maincat})
      : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Color c2 = Color.fromARGB(255, 189, 173, 252);
  Stream<QuerySnapshot<Object?>> cateStream(String cate) {
    final Stream<QuerySnapshot> menstream =
        FirebaseFirestore.instance.collection(cate).snapshots();
    return menstream;
  }

  String ShowStr(String n, int l) {
    String d = '';
    if (n.length > l) {
      for (var i = 0; i < l; i++) {
        d = d + n[i];
      }
      return d + '...';
    }
    return n + '..';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 320,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, c2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PageBar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 240,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(2, 2),
                                    )
                                  ]),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chevron_left_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 260,
                            height: 240,
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                    image: NetworkImage(
                                        widget.product['img'].toString())),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 240,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(2, 2),
                                    )
                                  ]),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 40,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                'Rs. ' + widget.product['saleprice'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                'MRP ' + widget.product['mrp'],
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                              width: 40,
                              height: 40,
                              color: Colors.transparent,
                              child: Center(
                                child: Icon(CupertinoIcons.heart),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Container(
                          width: 250,
                          color: Colors.transparent,
                          child: Text(
                            widget.product['name'],
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Container(
                          width: 350,
                          color: Colors.transparent,
                          child: Text(
                            widget.product['desc'],
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Container(
                          width: 250,
                          color: Colors.transparent,
                          child: Text(
                            'saler : ' + widget.product['salername'],
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ],
                                color: Colors.green,
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text('Buy Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ],
                                color: Colors.orangeAccent,
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text('Add To Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Ralated Product Grid View
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Related Product :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            StreamBuilder(
              stream: cateStream(widget.maincat),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  print('Something has wrong');
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
                final List data = [];
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map a = document.data() as Map<String, dynamic>;
                  data.add(a);
                }).toList();

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      for (var i = data.length - 1; i > 0; i -= 2) ...[
                        if (data[i]['subcategory'] ==
                            widget.product['subcategory']) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
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
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductView(
                                              product: data[i],
                                              maincat: widget.maincat,
                                            ),
                                          ));
                                    });
                                  },
                                  child: Container(
                                    width: 180,
                                    height: 280,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 0),
                                                    blurRadius: 5,
                                                  )
                                                ],
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Image(
                                                  image: NetworkImage(
                                                      data[i]['img']),
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Container(
                                              height: 25,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text(
                                                  ShowStr(data[i]['name'], 15),
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Container(
                                              height: 25,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text(ShowStr(
                                                    data[i]['desc'], 25)),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Container(
                                              height: 25,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text('saler: ' +
                                                    data[i]['salername']),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 25,
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      'Rs. ' +
                                                          data[i]['saleprice'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                  height: 25,
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                        'MRP ' + data[i]['mrp'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 12)),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () async {
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
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductView(
                                              product: data[i + 1],
                                              maincat: widget.maincat,
                                            ),
                                          ));
                                    });
                                  },
                                  child: Container(
                                    width: 180,
                                    height: 280,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 0),
                                                    blurRadius: 5,
                                                  )
                                                ],
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Image(
                                                  image: NetworkImage(
                                                      data[i - 1]['img']),
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Container(
                                              height: 25,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text(
                                                  ShowStr(
                                                      data[i - 1]['name'], 15),
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Container(
                                              height: 25,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text(ShowStr(
                                                    data[i - 1]['desc'], 25)),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Container(
                                              height: 25,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Text('saler: ' +
                                                    data[i - 1]['salername']),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 25,
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                      'Rs. ' +
                                                          data[i - 1]
                                                              ['saleprice'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                  height: 25,
                                                  color: Colors.transparent,
                                                  child: Center(
                                                    child: Text(
                                                        'MRP ' +
                                                            data[i - 1]['mrp'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 12)),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ]
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PageBar extends StatefulWidget {
  const PageBar({
    Key? key,
  }) : super(key: key);

  @override
  State<PageBar> createState() => _PageBarState();
}

class _PageBarState extends State<PageBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 35,
            )),
        Container(
            width: 100,
            height: 35,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Center(
              child: Text(
                'Quick',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Shop',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 115),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}
