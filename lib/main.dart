import 'package:flutter/material.dart';
import 'package:login_page/core/store.dart';
import 'package:login_page/pages/cart_page.dart';
import 'package:login_page/pages/loginpage.dart';
import 'package:login_page/util/profile.dart';
import 'package:login_page/util/routes.dart';
import 'package:login_page/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/homepage.dart';




void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: myroutes.loginroute,
      routes: {
        "/": (context) => loginpage(),
        myroutes.homeroute: (context) => homepage(),
        myroutes.loginroute: (context) => loginpage(),
        myroutes.cartroute: (context) => CartPage(),
        myroutes.profileroute: (context) => ProfilePage(),
      },

    );
  }
}
