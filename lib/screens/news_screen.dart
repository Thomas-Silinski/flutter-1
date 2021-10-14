import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';
import 'package:project/components/post.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  final ArticleController articleController = Get.put(ArticleController());
  final ButtonStyle styleButton =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16), fixedSize: const Size(150, 40), primary: const Color(0xFFF54B64),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text(
                      'NEWS',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: ElevatedButton(
                      style: styleButton,
                      onPressed: () => articleController.create(Article(
                        content: 'fake content fake content vfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake contentfake content',
                        title: 'fake title',
                      )),
                      child: const Text('+  Create Article'),
                    ),
                  ),
                ],
            ),
            Expanded (
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget> [
                  Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: articleController.articles
                        .map(
                          (Article a) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              NewsPost(title: a.title, subtitle: a.content, id: a.id,),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],)
            ),
          ],
        ),
      ),
    );
  }
}