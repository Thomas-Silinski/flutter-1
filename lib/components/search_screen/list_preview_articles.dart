import 'package:flutter/material.dart';
import 'package:project/components/search_screen/card_article.dart';
import 'package:project/models/article.dart';

class ListPreviewArticles extends StatelessWidget {
  const ListPreviewArticles({
    Key? key,
    required this.listArticles,
    required this.title,
    required this.size,
  }) : super(key: key);

  final List<Article> listArticles;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: size,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listArticles.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: size,
                  child: CardArticle(
                    id: listArticles[index].id,
                    title: listArticles[index].title,
                    imgBytes: listArticles[index].thumbnail,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}