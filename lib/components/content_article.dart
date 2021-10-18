import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/article.dart';
import 'package:project/models/user.dart';

class ContentArticle extends StatelessWidget {
  const ContentArticle({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  final Uint8List thumbnail;
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
            Image.memory(
              thumbnail,
              height: 70,
              width: 70,
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

class _ArticleDescription extends StatefulWidget {
  _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String id;

  @override
  State<_ArticleDescription> createState() => _ArticleDescriptionState();
}

class _ArticleDescriptionState extends State<_ArticleDescription> {
  final UserController userController = Get.find<UserController>();
  final ArticleController articleController = Get.find<ArticleController>();
  late User? user;
  late Article? article;
  late bool isMine;

  @override
  void initState() {
    user = userController.currentUser;
    if (user != null) {
      article = articleController.find(widget.id);
      if (article!.author == user!.id) {
        isMine = true;
      } else {
        isMine = false;
      }
    } else {
      isMine = false;
    }
    super.initState();
  }


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
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF54B64),
                  ),
                ),
              ),
              Expanded(child: Text(
                  widget.subtitle,
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
            child: isMine ? TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('Delete'),
              onPressed: () {
                articleController.delete(widget.id);
              },
            ) : null,
          ),
        )
      ],
    );
  }
}
