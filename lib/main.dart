import 'package:flutter/material.dart';
import 'package:quick_shop/pages/login_page.dart';
import 'package:quick_shop/pages/wellcome.dart';
import 'package:quick_shop/utils/routes.dart';

void main(List<String> args) {
  runApp(QuickShop());
}
class QuickShop extends StatelessWidget {
  const QuickShop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.light(),

      debugShowCheckedModeBanner: false,
      initialRoute:"/",
      routes: {
        "/" : (context) => const WellCome(),
        MyRoutes.loginroutes : (context) => LoginPage()
      },
    );
  }
}
