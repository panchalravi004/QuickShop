// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final String maincat;
  final List subcat;
  const ProductList({Key? key, required this.maincat, required this.subcat})
      : super(key: key);
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Color c5 = Colors.lightBlueAccent;
  Color c6 = Colors.lightGreenAccent;

  Color c7 = Colors.limeAccent;
  Color c8 = Color(0xFFE1F5FE);

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
    return n + ',...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 5)
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
                colors: [c5, c6],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          size: 35,
                          color: Colors.white,
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
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Column(
              children: [
                ListCategory(mainct: widget.maincat, subct: widget.subcat),
                SizedBox(height: 10),
                //fetch data from database
                StreamBuilder(
                  stream: cateStream(widget.maincat),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      print('something wrong');
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          for (var i = 0; i < data.length; i++) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [c6, c8],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 0),
                                          blurRadius: 10,
                                          spreadRadius: 0)
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 0),
                                                blurRadius: 5,
                                                spreadRadius: 0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(
                                            image:
                                                NetworkImage(data[i]['img'])),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 220,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 0),
                                                blurRadius: 5,
                                                spreadRadius: 0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 150,
                                                    child: Text(
                                                      ShowStr(
                                                          data[i]['name'], 12),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Icon(CupertinoIcons.heart)
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Text(
                                                ShowStr(data[i]['desc'], 25),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            Text(
                                                'Saler : ' +
                                                    data[i]['salername'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54)),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 2),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      'Rs.' +
                                                          data[i]['saleprice'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  Text(
                                                    'MRP ' + data[i]['mrp'],
                                                    style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Top Category List Out In Page as Per main Category
class ListCategory extends StatelessWidget {
  const ListCategory({
    Key? key,
    required this.mainct,
    required this.subct,
  }) : super(key: key);

  final String mainct;
  final List subct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          height: 50,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < subct.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 0),
                                  blurRadius: 10)
                            ],
                            border: Border.all(width: 1, color: Colors.black26),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(subct[i]),
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          )),
    );
  }
}
