// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters

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
  // late Animation padA;

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

  BoxDecoration radius() {
    return BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(10));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 280,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: TweenAnimationBuilder(
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 3,
                    decoration: radius(),
                  ),
                  TweenAnimationBuilder(
                    child: Container(
                      width: 170,
                      height: 3,
                      decoration: radius(),
                    ),
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 48, end: 12),
                    builder: (BuildContext context, double _val, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: _val),
                        child: child,
                      );
                    },
                  ),
                  Container(
                    width: 20,
                    height: 3,
                    decoration: radius(),
                  )
                ],
              ),
              duration: Duration(seconds: 1),
              tween: Tween<double>(begin: 50, end: 88),
              builder: (BuildContext context, double _val, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: _val),
                  child: child,
                );
              },
            ),
          ),
          Row(
            children: [
              TweenAnimationBuilder(
                child: Container(
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
                duration: Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 95),
                builder: (BuildContext context, double _val, child) {
                  return Padding(
                    padding: EdgeInsets.only(left: _val),
                    child: child,
                  );
                },
              ),
              TweenAnimationBuilder(
                child: Container(
                  width: 110,
                  height: 45,
                  alignment: Alignment(100, 500),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
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
                ),
                duration: Duration(seconds: 1),
                tween: Tween<double>(begin: 180, end: 25),
                builder: (BuildContext context, double _val, child) {
                  return Padding(
                    padding: EdgeInsets.only(left: _val),
                    child: child,
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: TweenAnimationBuilder(
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 3,
                    decoration: radius(),
                  ),
                  TweenAnimationBuilder(
                    child: Container(
                      width: 170,
                      height: 3,
                      decoration: radius(),
                    ),
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 48, end: 12),
                    builder: (BuildContext context, double _val, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: _val),
                        child: child,
                      );
                    },
                  ),
                  Container(
                    width: 20,
                    height: 3,
                    decoration: radius(),
                  )
                ],
              ),
              duration: Duration(seconds: 1),
              tween: Tween<double>(begin: 50, end: 88),
              builder: (BuildContext context, double _val, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: _val),
                  child: child,
                );
              },
            ),
          ),
          Center(
              child: TweenAnimationBuilder(
            child: Text(
              "Online Shoping Store",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            duration: Duration(seconds: 1),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (BuildContext context, double _val, child) {
              return Opacity(
                opacity: _val,
                child: child,
              );
            },
          )),
          SizedBox(
            height: 350,
          ),
          Center(
            child: Text(
              "Make In India",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
