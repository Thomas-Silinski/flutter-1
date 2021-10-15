import 'model.dart';

class Article extends Model {
  String title;
  String content;
  String author;

  Article({
    String? id,
    required this.title,
    required this.content,
    required this.author,
  }) : super(id: id);

  @override
  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        author = json['author'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'author': author,
        'id': id,
      };
}
