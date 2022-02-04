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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
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
                                  decoration: decCard(Colors.lightGreenAccent),
                                  child: Center(
                                    child: Image(width: 30,height:30,image: NetworkImage('https://i.ibb.co/KKn5mGD/men.png')),
                                  ),
                                ),
                                Text("Men")
                              ],
                            ),
                          ),
                        ),
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
                                  decoration: decCard(Colors.yellowAccent),
                                  child: Center(
                                    child: Image(width: 30,height:30,image: NetworkImage('https://i.ibb.co/kK7NccG/women.png')),
                                  ),
                                ),
                                Text("Women")
                              ],
                            ),
                          ),
                        ),
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
                                  decoration: decCard(Colors.pinkAccent[100]),
                                  child: Center(
                                    child: Image(width: 30,height:30,image: NetworkImage('https://i.ibb.co/fv7W84j/baby-body.png')),
                                  ),
                                ),
                                Text("Baby")
                              ],
                            ),
                          ),
                        ),
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
                                  decoration: decCard(Colors.yellow),
                                  child: Center(
                                    child: Image(width: 30,height:30,image: NetworkImage('https://i.ibb.co/m5tYKSj/furnitures.png')),
                                  ),
                                ),
                                Text("Furniture")
                              ],
                            ),
                          ),
                        ),
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
                                  decoration: decCard(Colors.lightBlueAccent),
                                  child: Center(
                                    child: Image(width: 30,height:30,image: NetworkImage('https://i.ibb.co/GsyKNRy/elec.png')),
                                  ),
                                ),
                                Text("Electronics")
                              ],
                            ),
                          ),
                        ),
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
                                  decoration: decCard(Colors.greenAccent),
                                  child: Center(
                                    child: Image(width: 30,height:30,image: NetworkImage('https://i.ibb.co/MSxvb6Q/sport.png')),
                                  ),
                                ),
                                Text("Sports")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ])),
    );
  }
}
