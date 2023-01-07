import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/store.dart';
import 'package:flutter_tutorial/pages/cart_page.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/login_page.dart';
import 'package:flutter_tutorial/utilis/routes.dart';
import 'package:flutter_tutorial/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main(List<String> args) {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: ,
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
