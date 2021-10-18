import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/routes.dart';
import 'package:project/controllers/article.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SPLASH SCREEN',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              ElevatedButton(
                onPressed: () => Get.offNamed(loginRoute),
                child: const Text('GO TO LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
