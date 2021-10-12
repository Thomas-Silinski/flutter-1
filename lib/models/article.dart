import 'model.dart';

class Article extends Model {
  String title;
  String content;

  Article({
    String? id,
    required this.title,
    required this.content,
  }) : super(id: id);

  @override
  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'id': id,
      };
}
