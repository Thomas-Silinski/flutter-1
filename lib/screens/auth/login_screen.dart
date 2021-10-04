import 'package:flutter/material.dart';
import 'package:project/constants/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                onPressed: () =>
                    Navigator.popAndPushNamed(context, registerRoute),
                child: const Text('GO TO REGISTER'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, homeRoute),
                child: const Text('GO TO HOME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
