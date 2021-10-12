import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleButton =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NEWS PAGE',
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: <Widget>[
          ElevatedButton(
            style: styleButton,
            onPressed: () {},
            child: const Text('+  Create Article'),
          ),
        ],
      ),
    );
  }
}
