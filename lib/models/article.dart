import 'model.dart';

class Article extends Model {
  String title;
  String content;

  Article({
    String? id,
    required this.title,
    required this.content,
  }) : super(id);
}
