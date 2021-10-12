import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.id,
    this.thumbnail = '',
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
          CustomListItemTwo(
            thumbnail: thumbnail != '' ? thumbnail : 'https://static.neopse.com/medias/p/541/site/27/7e/4a/277e4a89cd55292451d78bea1f08b1649d3b481d.png?v=v1',
            title: title,
            subtitle: subtitle,
            id: id,
          ),
        ],
      ),
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String subtitle;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: SizedBox(
        height: 100,
        width: 400,
        child: Row(
          children: <Widget>[
            Image(
              height: 70,
              image: NetworkImage(thumbnail),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  id: id,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF54B64),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 4.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(230.0, 20.0, 0.0, 0.0),
                  primary: Colors.white,
                ),
                child: const Text('Delete'),
                onPressed: () {
                  // articleController.delete(id);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
