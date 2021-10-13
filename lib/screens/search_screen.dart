import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/search_screen/list_preview_articles.dart';
import 'package:project/components/search_screen/search_bar.dart';
import 'package:project/constants/colors.dart';
import 'package:project/controllers/article.dart';
import 'package:project/models/article.dart';

class SearchScreen extends GetView<ArticleController> {
  SearchScreen({Key? key}) : super(key: key);

  final RxString _searchInput = ''.obs;
  final RxList<Article> _searchedArticle = <Article>[].obs;

  void _onSearchChanged(String value) {
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
                  onChanged: _onSearchChanged,
                ),
              ),
              Obx(
                () => _searchInput.value.isEmpty
                    ? _SearchBody(controller: controller)
                    // TODO(Melvyn) : Replace by widget in homescreen
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) =>
                                ListTile(
                              leading: const Icon(Icons.home),
                              title: Text(
                                _searchedArticle[index].title,
                              ),
                              tileColor: kDarkGrey,
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
                title: 'Articles recommend for you',
                size: 170,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListPreviewArticles(
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
