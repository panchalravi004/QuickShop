// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductUpload extends StatefulWidget {
  const ProductUpload({Key? key}) : super(key: key);

  @override
  _ProductUploadState createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
  // String maincate = 'none';
  // List<S2Choice<String>> mainopt = [
  //   S2Choice<String>(value: 'men', title: 'Men'),
  //   S2Choice<String>(value: 'women', title: 'Women'),
  // ];

  final _formkey = GlobalKey<FormState>();

  final idctl = TextEditingController();
  final namectl = TextEditingController();
  final descctl = TextEditingController();
  final mrpctl = TextEditingController();
  final actpctl = TextEditingController();
  final salerctl = TextEditingController();
  final imgctl = TextEditingController();
  final mainctl = TextEditingController();
  final subctl = TextEditingController();

  Future<void> msg(String msg) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Thank You"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(msg)],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
          ],
        );
      },
    );
  }

  Future<void> addProduct() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      FirebaseFirestore.instance.collection(mainctl.text.toString()).doc().set({
        'id': idctl.text.toString(),
        'name': namectl.text.toString(),
        'desc': descctl.text.toString(),
        'mrp': mrpctl.text.toString(),
        'saleprice': actpctl.text.toString(),
        'salername': salerctl.text.toString(),
        'img': imgctl.text.toString(),
        'subcategory': subctl.text.toString()
      }).then((value) {
        Navigator.of(context).pop();
        msg('Product Upload');
      });
    } catch (e) {
      print(e);
    }
  }

  clear() {
    idctl.clear();
    namectl.clear();
    descctl.clear();
    mrpctl.clear();
    actpctl.clear();
    salerctl.clear();
    imgctl.clear();
    mainctl.clear();
    subctl.clear();
  }

  @override
  void initState() {
    super.initState();
    mainctl.text = 'men';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Product Upload"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: idctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Product id")),
                TextFormField(
                    controller: namectl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Product Name")),
                TextFormField(
                    controller: descctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Description")),
                TextFormField(
                    controller: mrpctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "MRP")),
                TextFormField(
                    controller: actpctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Actual Price")),
                TextFormField(
                    controller: salerctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Saler Name")),
                TextFormField(
                    controller: imgctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "image link")),
                TextFormField(
                    controller: mainctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Main Category")),
                TextFormField(
                    controller: subctl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: "Sub Category")),
                InkWell(
                  onTap: () {
                    setState(() {
                      addProduct();
                      clear();
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 45,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
