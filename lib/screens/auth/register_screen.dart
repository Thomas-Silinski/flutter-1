import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constants/routes.dart';
import 'package:get/get.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserController userController = Get.find<UserController>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register() {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      Get.snackbar('Error', 'All information are mandatory');
      return;
    }
    final User _user = User(
      name: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    userController.create(_user);
    Get.snackbar('Login Success', 'logged in as ${_user.name}');
    userController.login(_emailController.text, _passwordController.text);
    Get.offAllNamed(homeRoute);
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
                        child: _BuildTextFields(
                          usernameController: _usernameController,
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
                              onPressed: register,
                              child: const Text('Register'),
                            ),
                            ElevatedButton(
                              onPressed: () => Get.offNamed(loginRoute),
                              child: const Text(
                                  'Already have an account ? Go to login'),
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

class _BuildTextFields extends StatelessWidget {
  const _BuildTextFields({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
