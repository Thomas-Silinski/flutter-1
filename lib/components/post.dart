import 'package:flutter/material.dart';
import 'package:project/components/content_article.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.id,
    this.thumbnail = 'https://static.neopse.com/medias/p/541/site/27/7e/4a/277e4a89cd55292451d78bea1f08b1649d3b481d.png?v=v1',
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String id;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ContentArticle(
            thumbnail: thumbnail,
            title: title,
            subtitle: subtitle,
            id: id,
          ),
        ],
      ),
    );
  }
}