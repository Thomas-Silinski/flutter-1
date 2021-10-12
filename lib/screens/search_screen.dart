import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/list_articles_search.dart';
import 'package:project/components/search_bar.dart';
import 'package:project/controllers/article.dart';

class SearchScreen extends GetView<ArticleController> {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController _seachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  'SEARCH',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SearchBarWidget(
                  controller: _seachController,
                ),
              ),
              _SearchBody(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ArticleController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListArticlesSearch(
                listArticles: controller.articles,
                title: 'Top articles',
                size: 170,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListArticlesSearch(
                listArticles: controller.articles,
                title: 'Articles recommend for you',
                size: 170,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListArticlesSearch(
                listArticles: controller.articles,
                title: 'Users recommend for you',
                size: 170,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
