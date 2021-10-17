import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'model.dart';

class Article extends Model {
  String title;
  String content;
  String author;
  Uint8List thumbnail;

  Article({
    String? id,
    required this.title,
    required this.content,
    required this.author,
    required File thumbnail,
  })  : thumbnail = thumbnail.readAsBytesSync(),
        super(id: id);

  @override
  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        author = json['author'],
        thumbnail = base64Decode(json['thumbnail']),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'content': content,
        'author': author,
        'thumbnail': base64Encode(thumbnail),
        'id': id,
      };

  void updateThumbnail(File thumbnail) {
    this.thumbnail = thumbnail.readAsBytesSync();
  }
}
