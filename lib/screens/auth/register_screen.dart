import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constants/routes.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                        // A fixed-height child.
                        //color: const Color(0xffeeee00), // Yellow
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
                          //color: const Color(0xffee0000), // Red
                          alignment: Alignment.center,
                          child: _buildTextFields()),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          //color: const Color(0xffee0000), // Red
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            ElevatedButton(
                              onPressed: () => Get.offNamed(loginRoute),
                              child: const Text('Register'),
                            ),
                            ElevatedButton(
                              onPressed: () => Get.offNamed(loginRoute),
                              child: const Text(
                                  'Already have an account ? Go to login'),
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
        decoration: InputDecoration(labelText: 'Username'),
      ),
      //SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(labelText: 'Email'),
      ),
      //SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
    ],
  ));
}
