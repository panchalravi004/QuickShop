// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop/pages/category.dart';
import 'package:quick_shop/pages/home_page.dart';
import 'package:quick_shop/pages/login_page.dart';
import 'package:quick_shop/pages/userpage/update_user_profile.dart';
import 'package:quick_shop/pages/userpage/user_profile.dart';
//import 'package:quick_shop/pages/wellcome.dart';
import 'package:quick_shop/utils/routes.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(QuickShop());
}

class QuickShop extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something Went Worng");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            initialRoute: MyRoutes.loginroutes,
            routes: {
              //"/" : (context) => const WellCome(),
              MyRoutes.loginroutes: (context) => const LoginPage(),
              MyRoutes.homeroutes: (context) => const HomePage(),
              MyRoutes.profileroutes: (context) => const UserProfile(),
              MyRoutes.updateprofileroutes: (context) => const UpdateProfile(),
              MyRoutes.allCategory: (context) => const CategoryAll(),
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
