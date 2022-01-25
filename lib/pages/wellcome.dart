// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';

class WellCome extends StatefulWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  State<WellCome> createState() => _WellComeState();
}

class _WellComeState extends State<WellCome>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation padA;
  late Animation padB;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.forward();
    padA = Tween(begin: 0.0, end: 95.0).animate(controller);
    padB = Tween(begin: 180.0, end: 0.0).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  // Future<void> loopOnce(BuildContext context) async {
  //   await controller.forward();
  //   await Future.delayed(Duration(seconds: 1));
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            //width: SizeChange.value,
            height: 280,
            //color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 78,
                ),
                Container(
                  width: 20,
                  height: 3,
                  color: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: 170,
                    height: 3,
                    color: Colors.red,
                  ),
                ),
                Container(
                  width: 20,
                  height: 3,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: padA.value),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: 110,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "QUICK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: padB.value),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: 110,
                  height: 45,
                  alignment: Alignment(100, 500),
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "SHOP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
