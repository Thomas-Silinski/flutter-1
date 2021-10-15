import 'model.dart';

class Article extends Model {
  String title;
  String content;
  String author;
  String thumbnail;

  Article({
    String? id,
    required this.title,
    required this.content,
    required this.author,
    required this.thumbnail,
  }) : super(id: id);

  @override
  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        author = json['author'],
        thumbnail = json['thumbnail'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'content': content,
        'author': author,
        'id': id,
      };
}
