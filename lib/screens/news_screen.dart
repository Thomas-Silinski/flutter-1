import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/routes.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  final ArticleController articleController = Get.find<ArticleController>();

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
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: articleController.articles
                      .map(
                        (Article a) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('${a.title}, ${a.content}, ${a.id}'),
                            ElevatedButton(
                              onPressed: () => articleController.delete(a.id),
                              child: const Text('Delete this'),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(createRoute),
        tooltip: 'create new article',
        backgroundColor: kPrimaryGradient1,
        child: const Icon(Icons.create),
      ),
    );
  }
}
