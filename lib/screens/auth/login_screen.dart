import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/routes.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserController userController = Get.put(UserController());

  void login() {
    User? user = userController.login(
      'publisher@nytimes.com',
      '5up3R-51cR3T-pA55W0RD',
    );
    if (user == null) {
      Get.snackbar('Login failed', 'wrong credentials');
    } else {
      Get.snackbar('Login Success', 'logged in as ${user.name}');
      Get.offNamed(homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'LOGIN PAGE',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "Blop I'm the subtitle",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () => Get.offNamed(registerRoute),
                child: const Text('No account ? Go to register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
