import 'package:flutter/material.dart';
import 'package:project/components/appbar.dart';
import 'package:project/components/post.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleButton =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), fixedSize: Size(200, 200));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NEWS',
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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 140,
                      width: double.maxFinite,
                      child: NewsPost(
                      ),
                  );
                }
              )
            )
          ],
        ),
        // padding: EdgeInsets.fromLTRB(10,10,10,0),
        // height: 140,
        // width: double.maxFinite,
        // // child: const Align(
        // //   alignment: Alignment.topCenter,
        // child: NewsPost(
        // ),
        // ),
      ),
    );
  }
}