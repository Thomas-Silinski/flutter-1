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
      'toto@haricot.mail',
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
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
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
                          child: _buildTextFields()),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            ElevatedButton(
                              onPressed: login,
                              child: const Text('Login'),
                            ),
                            ElevatedButton(
                              onPressed: () => Get.offNamed(registerRoute),
                              child: const Text('No account ? Go to register'),
                            ),
                          ])),
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

Widget _buildTextFields() {
  return Scaffold(
    body: Column(
      children: const <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
      ],
    ),
  );
}
