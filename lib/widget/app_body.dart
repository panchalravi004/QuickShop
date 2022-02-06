// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:quick_shop/widget/category/home_category.dart';
import 'package:quick_shop/widget/body_section/men_section.dart';

class MyAppBody extends StatefulWidget {
  const MyAppBody({Key? key}) : super(key: key);

  @override
  _MyAppBodyState createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 175),
          child: Column(
            children: [
              Category(), //show category
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Container(
                      height: 2, color: Colors.deepPurpleAccent[100])),
              MenSection(),
            ],
          ),
        ),
      ),
    );
  }
}
