import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article_controller.dart';
import 'package:project/models/article.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'NEWS PAGE',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "Blop I'm the subtitle",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              ...articleController.articles
                  .map((Article a) => Text('${a.title}, ${a.content}'))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
