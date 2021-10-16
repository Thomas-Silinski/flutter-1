import 'dart:convert';
import 'dart:io';

import 'model.dart';

class User extends Model {
  String name;
  String email;
  String password;
  List<int>? picture;

  User({
    String? id,
    required this.name,
    required this.email,
    required this.password,
    File? picture,
  })  : picture = picture?.readAsBytesSync(),
        super(id: id);

  @override
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        picture = base64Decode(json['picture']),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'password': password,
        'picture': picture != null ? base64Encode(picture!) : null,
        'id': id,
      };

  void updatePicture(File picture) {
    this.picture = picture.readAsBytesSync();
  }
}
