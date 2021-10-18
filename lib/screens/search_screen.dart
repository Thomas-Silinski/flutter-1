import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/post.dart';
import 'package:project/components/search_screen/list_preview_articles.dart';
import 'package:project/components/search_screen/search_screen_header.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';

class SearchScreen extends GetView<ArticleController> {
  SearchScreen({Key? key}) : super(key: key);

  final RxString _searchInput = ''.obs;
  final RxList<Article> _searchedArticle = <Article>[].obs;

  void onSearchChanged(String value) {
    _searchInput.value = value;
    _searchedArticle.value = controller.search(value).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchScreenHeader(
                onSearchChanged: onSearchChanged,
              ),
              Obx(
                () => _searchInput.value.isEmpty
                    ? _SearchBody(controller: controller)
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) =>
                                NewsPost(
                              title: _searchedArticle[index].title,
                              subtitle: _searchedArticle[index].content,
                              thumbnail: _searchedArticle[index].thumbnail,
                              id: _searchedArticle[index].id,
                            ),
                            itemCount: _searchedArticle.length,
                          ),
                        ),
                      ),
              ),
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
              child: ListPreviewArticles(
                listArticles: controller.articles,
                title: 'Top articles',
                size: 170,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListPreviewArticles(
                listArticles: controller.articles,
                title: 'Articles recommended for you',
                size: 170,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListPreviewArticles(
                listArticles: controller.articles,
                title: 'Users recommended for you',
                size: 170,
              ),
            ),
          ],
        ),
      ),
    );
  }
}