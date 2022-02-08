// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quick_shop/Product/product_list.dart';

class CategoryAll extends StatefulWidget {
  const CategoryAll({Key? key}) : super(key: key);

  @override
  _CategoryAllState createState() => _CategoryAllState();
}

class _CategoryAllState extends State<CategoryAll> {
  var c1 = Color.fromARGB(255, 0, 229, 255);
  var c2 = Color(0xFF7E57C2);

  var c5 = Colors.yellow;
  var c6 = Colors.lightGreenAccent;

  var c7 = Color.fromARGB(255, 189, 173, 252);
  var c8 = Color(0xFF29B6F6);

  var c9 = Colors.orange;
  var c10 = Colors.lightGreenAccent;

  var c11 = Colors.yellow;
  var c12 = Colors.redAccent;

  var c13 = Colors.lightBlueAccent;
  var c14 = Colors.deepPurpleAccent;

  List<dynamic> clr = [
    [Color.fromARGB(255, 0, 229, 255), Color(0xFF7E57C2)],
    [Colors.yellow, Colors.lightGreenAccent],
    [Color.fromARGB(255, 189, 173, 252), Color(0xFF29B6F6)],
    [Colors.lightBlueAccent, Colors.lightGreenAccent],
    [Colors.yellow, Colors.redAccent],
    [Colors.lightBlueAccent, Colors.deepPurpleAccent],
  ];

  List<String> maincategory = [
    'Men',
    'Women',
    'Baby',
    'Furniture',
    'Electronics',
    'Sports'
  ];
  List<String> titlevalue = [
    'men',
    'women',
    'baby',
    'furniture',
    'electronics',
    'sports'
  ];
  List<dynamic> subcategory = [
    ['All', 'TopWear', 'BottomWear', 'FootWear'],
    ['All', 'TopWear', 'BottomWear', 'FootWear'],
    ['All', 'TopWear', 'BottomWear', 'FootWear'],
    ['All', 'SofaSet', 'Chair&Table', 'TVTable'],
    ['All', 'MobilePhone', 'Tablet', 'LEDTv', 'Watch', 'Ac/Fridge'],
    ['All', 'SportsWear', 'FootWear', 'Material', 'SportShoes', 'Watch'],
  ];
  static late String main;
  static late List sub;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          toolbarHeight: 90,
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
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                  colors: [c5, c6],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            size: 35,
                            color: Colors.white,
                          )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2, 2),
                              blurRadius: 0)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black12,
                                offset: Offset(0, 0),
                                blurRadius: 10)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'Your Choice is Pleasure For us !',
                    style: TextStyle(color: Colors.black26),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Column(
                children: [
                  for (var i = 0; i < maincategory.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 0),
                                  blurRadius: 15,
                                  spreadRadius: 5)
                            ],
                            gradient: LinearGradient(
                                colors: [clr[i][0], clr[i][1]],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(5, 5),
                                            blurRadius: 10,
                                            spreadRadius: 0)
                                      ],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        maincategory[i],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 240),
                                InkWell(
                                  onTap: () async {
                                    main = titlevalue[i];
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
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductList(
                                              maincat: main,
                                              subcat: sub,
                                              selected: 'all',
                                            ),
                                          ));
                                    });
                                  },
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Row(
                                  children: [
                                    for (var j = 0;
                                        j < subcategory[i].length;
                                        j++) ...[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: InkWell(
                                          onTap: () async {
                                            main = titlevalue[i];
                                            sub = subcategory[i];
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            );
                                            await Future.delayed(
                                                Duration(seconds: 2));
                                            Navigator.of(context).pop();
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductList(
                                                      maincat: main,
                                                      subcat: sub,
                                                      selected: subcategory[i][j],
                                                    ),
                                                  ));
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6),
                                                child: Text(
                                                  subcategory[i][j],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
        ));
  }
}
