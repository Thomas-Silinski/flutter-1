import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/home.dart';
import 'package:project/screens/auth/register_screen.dart';

import 'constants/routes.dart';
import 'screens/auth/login_screen.dart';
import 'screens/splash_screen.dart';
import 'themes/themes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/rendering.dart';

void main() async {
  await GetStorage.init();
  debugPaintSizeEnabled=true;
  runApp(const Routing());
}

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes().darkTheme,
      initialRoute: '/',
      getPages: [
        GetPage<SplashScreen>(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage<LoginScreen>(
          name: loginRoute,
          page: () => const LoginScreen(),
        ),
        GetPage<RegisterScreen>(
          name: registerRoute,
          page: () => const RegisterScreen(),
        ),
        GetPage<Home>(
          name: homeRoute,
          page: () => const Home(),
        ),
      ],
    );
  }
}
