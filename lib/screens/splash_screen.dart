import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/routes.dart';

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
              const SizedBox(
                child: Text(
                  'Welcome\non\nEasy App',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0),
                ),
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
