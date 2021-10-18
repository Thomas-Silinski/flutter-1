import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/auth/login_form.dart';
import 'package:project/constants/routes.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final UserController userController = Get.find<UserController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please verify your informations');
      return;
    }
    User? user = userController.login(
      _emailController.text,
      _passwordController.text,
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Welcome\non\nEasy App',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}