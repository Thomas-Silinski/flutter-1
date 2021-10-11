import 'model.dart';

class User extends Model {
  String name;
  String email;

  User({
    String? id,
    required this.name,
    required this.email,
  }) : super(id);
}
