import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/home.dart';
import 'package:project/screens/auth/register_screen.dart';
import 'package:project/screens/vue_article_screen.dart';
import 'package:project/screens/create_screen.dart';

import 'constants/routes.dart';
import 'screens/auth/login_screen.dart';
import 'screens/splash_screen.dart';
import 'themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ArticleController());
  Get.put(UserController());
  runApp(const Routing());
}

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes().darkTheme,
      initialRoute: '/',
      getPages: <GetPage<dynamic>>[
        GetPage<SplashScreen>(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage<LoginScreen>(
          name: loginRoute,
          page: () => LoginScreen(),
        ),
        GetPage<RegisterScreen>(
          name: registerRoute,
          page: () => RegisterScreen(),
        ),
        GetPage<Home>(
          name: homeRoute,
          page: () => const Home(),
        ),
        GetPage<Home>(
          name: articleRoute,
          page: () => const VueArticleScreen(),
        ),
        GetPage<CreateScreen>(
          name: createRoute,
          page: () => CreateScreen(),
        ),
      ],
    );
  }
}
