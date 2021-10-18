import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/content_article.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/routes.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.id,
    required this.thumbnail,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String id;
  final Uint8List thumbnail;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: kPrimaryGradient2.withOpacity(0.8),
        onTap: () => Get.toNamed(
          articleRoute,
          parameters: <String, String>{'id': id},
        ),
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
      ),
    );
  }
}
