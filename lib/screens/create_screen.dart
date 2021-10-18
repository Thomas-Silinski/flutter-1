import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/article.dart';
import 'package:project/models/user.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({Key? key}) : super(key: key);

  final ArticleController articleController = Get.find<ArticleController>();
  final UserController userController = Get.find<UserController>();

  final RxString headline = ''.obs;
  final RxString content = ''.obs;
  final Rx<File?> thumbnailFile = Rx<File?>(null);

  final ImagePicker picker = ImagePicker();

  void updateHeadline(String value) {
    headline.value = value;
  }

  void updateContent(String value) {
    content.value = value;
  }

  void updateThumbnail(XFile? value) {
    if (value != null) thumbnailFile.value = File(value.path);
  }

  bool canSubmit() {
    return headline.isNotEmpty &&
        content.isNotEmpty &&
        thumbnailFile.value != null;
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GradientText(
                        text: 'Headline',
                        gradient: const LinearGradient(
                          colors: <Color>[
                            kPrimaryGradient1,
                            kPrimaryGradient2,
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: updateHeadline,
                        decoration: const InputDecoration(
                          hintText: 'Your post title',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GradientText(
                        text: 'Thumbnail',
                        gradient: const LinearGradient(
                          colors: <Color>[
                            kPrimaryGradient1,
                            kPrimaryGradient2,
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          if (thumbnailFile.value != null)
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 200,
                                maxWidth: 200,
                              ),
                              child: Image.file(
                                thumbnailFile.value!,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          Column(
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: kPrimaryGradient2,
                                onPressed: () => picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then(updateThumbnail),
                                tooltip: 'Pick thumbnail from gallery',
                                child: const Icon(Icons.photo),
                              ),
                              const SizedBox(height: 8),
                              FloatingActionButton(
                                backgroundColor: kPrimaryGradient2,
                                onPressed: () => picker
                                    .pickImage(source: ImageSource.camera)
                                    .then(updateThumbnail),
                                tooltip: 'Take a new picture',
                                child: const Icon(Icons.camera_alt),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GradientText(
                        text: 'Content',
                        gradient: const LinearGradient(
                          colors: <Color>[
                            kPrimaryGradient1,
                            kPrimaryGradient2,
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: updateContent,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: 'Your post content',
                          contentPadding: EdgeInsets.all(20),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: canSubmit()
              ? () {
                  final User user = userController.currentUser!;
                  final Article article = Article(
                    title: headline.value,
                    content: content.value,
                    author: user.id,
                    thumbnail: thumbnailFile.value!,
                  );
                  articleController.create(article);
                  Get.back();
                }
              : null,
          tooltip: 'Create article',
          backgroundColor: canSubmit() ? kPrimaryGradient1 : kDarkGrey,
          child: const Icon(
            Icons.save,
          ),
        ),
      ),
    );
  }
}
