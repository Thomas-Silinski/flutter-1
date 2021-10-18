import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/routes.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/article.dart';
import 'package:project/models/user.dart';

class VueArticleScreen extends StatefulWidget {
  const VueArticleScreen({Key? key}) : super(key: key);

  @override
  State<VueArticleScreen> createState() => _VueArticleScreenState();
}

class _VueArticleScreenState extends State<VueArticleScreen> {
  final String? _articleId = Get.parameters['id'];
  final ArticleController _articleController = Get.find<ArticleController>();
  final UserController _userController = Get.find<UserController>();
  late Article? _article;
  late User? _author;

  @override
  void initState() {
    if (_articleId != null) {
      _article = _articleController.find(_articleId!);
      if (_article == null) {
        Get.toNamed(homeRoute);
      }
      _author = _userController.find(_article!.author);
    } else {
      Get.toNamed(homeRoute);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.memory(
                  _article!.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: GradientText(
                        text: _article!.title,
                        gradient: const LinearGradient(
                          colors: <Color>[
                            kPrimaryGradient1,
                            kPrimaryGradient2,
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: _author!.picture != null
                              ? Image.memory(_author!.picture!)
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Posted by ${_author!.name}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        _article!.content,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
