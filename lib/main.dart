import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/home.dart';
import 'package:project/screens/auth/register_screen.dart';

import 'constants/routes.dart';
import 'screens/auth/login_screen.dart';
import 'screens/splash_screen.dart';
import 'themes/themes.dart';

void main() {
  runApp(const Routing());
}

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes().darkTheme,
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => const SplashScreen(),
        loginRoute: (BuildContext context) => const LoginScreen(),
        registerRoute: (BuildContext context) => const RegisterScreen(),
        homeRoute: (BuildContext context) => const Home(),
      },
    );
  }
}
