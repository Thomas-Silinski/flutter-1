import 'package:get/get.dart';
import 'package:project/models/article.dart';

import 'controller.dart';

typedef JsonArticle = Map<String, String>;
typedef JsonArticleList = List<JsonArticle>;

class ArticleController extends AppController {
  @override
  String storeId = 'articles';

  final List<Article> articles = <Article>[].obs;
  List<dynamic> _jsonList = <dynamic>[];

  @override
  void onInit() {
    _restoreArticles();
    super.onInit();
  }

  void addAndStoreArticle(Article article) {
    articles.add(article);

    _jsonList.add(<String, String>{
      'title': article.title,
      'content': article.content,
      'id': article.id,
    });
    storage = _jsonList;
  }

  /// Populates the controller from the local storage
  void _restoreArticles() {
    _jsonList = storage;

    for (final dynamic article in _jsonList) {
      articles.add(Article(
        title: article['title'],
        content: article['content'],
        id: article['id'],
      ));
    }
  }

  void deleteAllArticlesWarning(String debug) {
    assert(debug == "i know what i'm doing");
  }
}
