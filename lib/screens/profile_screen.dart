import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';
import 'package:project/components/post.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                      ),
                      Text(
                        'Thomas',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                      ),
                      Text(
                        'thomas@gmail.com',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                      ),
                      ElevatedButton(
                        style: styleButton,
                        onPressed: () => articleController.create(Article(
                          content: 'fake content',
                          title: 'fake title',
                        )),
                        child: const Text('Logout'),
                      ),
                    ]
                  ),
                  SizedBox(width: 70),
                  Image(
                    height: 75,
                    image: NetworkImage('https://gem.ec-nantes.fr/wp-content/uploads/2019/01/profil-vide.png'),
                  ),
                ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget> [
            //     Text(
            //       'Posted articles',
            //       style: Theme.of(context).textTheme.bodyText1,
            //     ),
            //   ]
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              child: Text(
                'Posted articles',
                style: Theme.of(context).textTheme.bodyText1,
              ),
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