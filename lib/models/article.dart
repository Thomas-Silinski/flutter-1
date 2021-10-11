import 'dart:math';
import 'dart:convert';

String randomId(int len) {
  Random random = Random.secure();
  List<int> values = List<int>.generate(len, (int i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class Article {
  String id;
  String title;
  String content;

  Article({
    String? id,
    required this.title,
    required this.content,
  }) : id = id ?? randomId(15);
}
