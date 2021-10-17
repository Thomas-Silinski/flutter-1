import 'model.dart';

class User extends Model {
  String name;
  String email;
  String password;

  User({
    String? id,
    required this.name,
    required this.email,
    required this.password,
  }) : super(id: id);

  @override
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'password': password,
        'id': id,
      };
}
