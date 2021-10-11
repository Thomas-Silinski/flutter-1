import 'package:get/get.dart';
import 'package:project/models/article.dart';

import 'controller.dart';

typedef JsonArticle = Map<String, String>;
typedef JsonArticleList = List<JsonArticle>;

class ArticleController extends AppController {
  @override
  String storeId = 'articles';

  final List<Article> _articles = <Article>[].obs;
  List<Article> get articles => _articles;

  List<dynamic> _jsonList = <dynamic>[];

  @override
  Future<void> onInit() async {
    await super.onInit();
    _restore();
  }

  void _restore() {
    _jsonList = storage;

    for (final dynamic article in _jsonList) {
      _articles.add(Article.fromJson(article));
    }
  }

  void erase() {
    _articles.clear();
    _jsonList.clear();
    storage = _jsonList;
  }

  void create(Article article) {
    _articles.add(article);

    _jsonList.add(article.toJson());
    storage = _jsonList;
  }

  Article? find(String id) => _articles.firstWhere(
        (Article article) => article.id == id,
      );

  Iterable<Article> search(String title) => _articles.where(
        (Article article) => article.title == title,
      );

  void delete(String id) {
    _articles.removeWhere((Article article) => article.id == id);
    _jsonList.removeWhere((dynamic article) => article['id'] == id);
    storage = _jsonList;
  }
}
