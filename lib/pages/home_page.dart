// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member
// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:quick_shop/widget/app_bar.dart';
import 'package:quick_shop/widget/app_body.dart';
import 'package:quick_shop/widget/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: MyAppBody(),
      drawer: MyAppDrawer(),
    );
  }
}
