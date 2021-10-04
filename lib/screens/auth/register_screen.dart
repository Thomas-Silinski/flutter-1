import 'package:flutter/material.dart';
import 'package:project/constants/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                onPressed: () => Navigator.popAndPushNamed(context, loginRoute),
                child: const Text('GO TO LOGIN'),
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
