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
  }) : super(id);
}
