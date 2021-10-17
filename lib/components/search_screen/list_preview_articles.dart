import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';
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
                  child: _CardArticle(
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

class _CardArticle extends StatelessWidget {
  const _CardArticle({
    Key? key,
    required this.title,
    required this.imgBytes,
  }) : super(key: key);

  final String title;
  final Uint8List imgBytes;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kDarkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GradientText(
              text: title,
              gradient: const LinearGradient(
                colors: <Color>[
                  kPrimaryGradient1,
                  kPrimaryGradient2,
                ],
              ),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.memory(
                imgBytes,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
