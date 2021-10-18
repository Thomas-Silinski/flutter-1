import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:project/components/create_article/choose_thumbnail.dart';
import 'package:project/components/create_article/create_article_contain.dart';
import 'package:project/components/create_article/create_article_header.dart';
import 'package:project/constants/colors.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/article.dart';
import 'package:project/models/user.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({Key? key}) : super(key: key);

  final ArticleController _articleController = Get.find<ArticleController>();
  final UserController _userController = Get.find<UserController>();

  final RxString _headline = ''.obs;
  final RxString _content = ''.obs;
  final Rx<File?> _thumbnailFile = Rx<File?>(null);

  void _updateHeadline(String value) => _headline.value = value;

  void _updateContent(String value) => _content.value = value;

  void _updateThumbnail(XFile? value) {
    if (value != null) _thumbnailFile.value = File(value.path);
  }

  bool canSubmit() {
    return _headline.isNotEmpty &&
        _content.isNotEmpty &&
        _thumbnailFile.value != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a News Article'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Get.back,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CreateArticleHeader(
                  updateHeadline: _updateHeadline,
                ),
                const SizedBox(height: 30),
                ChooseThumbnail(
                  thumbnailFile: _thumbnailFile,
                  updateThumbnail: _updateThumbnail,
                ),
                const SizedBox(height: 30),
                CreateArticleContain(
                  updateContent: _updateContent,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: canSubmit()
              ? () {
                  final User user = _userController.currentUser!;
                  final Article article = Article(
                    title: _headline.value,
                    content: _content.value,
                    author: user.id,
                    thumbnail: _thumbnailFile.value!,
                  );
                  _articleController.create(article);
                  Get.back();
                }
              : null,
          tooltip: 'Create article',
          backgroundColor: canSubmit() ? kPrimaryGradient1 : kDarkGrey,
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
