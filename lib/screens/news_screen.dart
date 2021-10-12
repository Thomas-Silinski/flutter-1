import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';
import 'package:project/components/post.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  final ArticleController articleController = Get.put(ArticleController());
  final ButtonStyle styleButton =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16), fixedSize: Size(150, 40), primary: Color(0xFFF54B64));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'NEWS',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(width: 70),
                  ElevatedButton(
                    style: styleButton,
                    onPressed: () => articleController.create(Article(
                      content: 'fake content',
                      title: 'fake title',
                    )),
                    child: const Text('+  Create Article'),
                  ),
                ],
            ),
            Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: articleController.articles
                    .map(
                      (Article a) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          NewsPost(title: a.title, subtitle: a.content, id: a.id,),
                          // Text('${a.title}, ${a.content}, ${a.id}'),
                          // ElevatedButton(
                          //   style: TextButton.styleFrom(
                          //     padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          //     primary: Colors.white,
                          //   ),
                          //   onPressed: () => articleController.delete(a.id),
                          //   child: const Text('Delete this'),
                          // ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}