// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  BoxDecoration decCard(var clr) {
    return BoxDecoration(color: clr, borderRadius: BorderRadius.circular(50));
  }
  List<String> title = [
    'Men',
    'Women',
    'Baby',
    'Furniture',
    'Electronics',
    'Sports'
  ];
  List<String> img = [
    'https://i.ibb.co/KKn5mGD/men.png',
    'https://i.ibb.co/kK7NccG/women.png',
    'https://i.ibb.co/fv7W84j/baby-body.png',
    'https://i.ibb.co/m5tYKSj/furnitures.png',
    'https://i.ibb.co/GsyKNRy/elec.png',
    'https://i.ibb.co/MSxvb6Q/sport.png'
  ];
  List<Color?> bgcolor = [
    Colors.lightGreenAccent,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.lightBlueAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: SizedBox(
          height: 105,
          // color: Colors.amber,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Category",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < title.length; i++) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: decCard(bgcolor[i]),
                                    child: Center(
                                      child: Image(
                                          width: 30,
                                          height: 30,
                                          image: NetworkImage(img[i])),
                                    ),
                                  ),
                                  Text(title[i])
                                ],
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                )
              ])),
    );
  }
}
