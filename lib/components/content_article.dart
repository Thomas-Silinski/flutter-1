import 'package:flutter/material.dart';

class ContentArticle extends StatelessWidget {
  const ContentArticle({
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
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: SizedBox(
        height: 105,
        width: MediaQuery.of(context).size.width/1.1,
        child: Row(
          children: <Widget>[
            Image.network(
              thumbnail,
              height: 70,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
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
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF54B64),
                  ),
                ),
              ),
              Expanded(child: Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('Delete'),
              onPressed: () {
                // articleController.delete(id);
              },
            ),
          ),
        )
      ],
    );
  }
}
