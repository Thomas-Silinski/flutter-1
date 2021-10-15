import 'model.dart';

class User extends Model {
  String name;
  String email;
  String password;
  String? picture;

  User({
    String? id,
    required this.name,
    required this.email,
    required this.password,
    this.picture,
  }) : super(id: id);

  @override
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        picture = json['picture'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'picture': picture,
        'id': id,
      };
}
