// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quick_shop/utils/routes.dart';

class WellCome extends StatefulWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  State<WellCome> createState() => _WellComeState();
}

class _WellComeState extends State<WellCome>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    WidgetsBinding.instance
        ?.addPostFrameCallback((timeStamp) => loopOnce(context));
  }

  Future<void> loopOnce(BuildContext context) async {
    await controller.forward();
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushNamed(MyRoutes.loginroutes);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  BoxDecoration lineDecor() {
    return BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(10));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 310),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 3,
                    decoration: lineDecor(),
                  ),
                  TweenAnimationBuilder(
                    child: Container(
                      width: 170,
                      height: 3,
                      decoration: lineDecor(),
                    ),
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 72, end: 10),
                    builder: (BuildContext context, double _val, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: _val),
                        child: child,
                      );
                    },
                  ),
                  Container(
                    width: 15,
                    height: 3,
                    decoration: lineDecor(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 45,
                    child: Center(
                        child: Text(
                      "QUICK",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 3),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        )),
                  ),
                  TweenAnimationBuilder(
                    child: Container(
                      height: 45,
                      color: Colors.white,
                    ),
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 140, end: 0),
                    builder: (BuildContext context, double _val, child) {
                      return SizedBox(
                        width: _val,
                        child: child,
                      );
                    },
                  ),
                  Container(
                    width: 110,
                    height: 45,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "SHOP",
                        style: TextStyle(
                            color: Colors.red[600],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 3,
                    decoration: lineDecor(),
                  ),
                  TweenAnimationBuilder(
                    child: Container(
                      width: 170,
                      height: 3,
                      decoration: lineDecor(), 
                    ),
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 72, end: 10),
                    builder: (BuildContext context, double _val, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: _val),
                        child: child,
                      );
                    },
                  ),
                  Container(
                    width: 15,
                    height: 3,
                    decoration: lineDecor(),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Online Shoping Store",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    "Make In India",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
