import 'package:project/models/user.dart';

import 'controller.dart';

typedef JsonUser = Map<String, String>;
typedef JsonUserList = List<JsonUser>;

class UserController extends AppController {
  @override
  String storeId = 'users';

  final List<User> _users = <User>[];
  List<dynamic> _jsonList = <dynamic>[];

  User? currentUser;

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  void restore() {
    _jsonList = storage;

    for (final dynamic user in _jsonList) {
      _users.add(User(
        name: user['name'],
        email: user['email'],
        password: user['password'],
        id: user['id'],
      ));
    }
  }

  void erase() {
    _users.clear();
    _jsonList.clear();
    storage = _jsonList;
  }

  void create(User user) {
    _users.add(user);

    _jsonList.add(<String, String>{
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'id': user.id,
    });
    storage = _jsonList;
  }

  User? find(String id) => _users.firstWhere(
        (User user) => user.id == id,
      );

  Iterable<User> search(String name) => _users.where(
        (User user) => user.name == name,
      );

  void delete(String id) {
    _users.removeWhere((User user) => user.id == id);
    _jsonList.removeWhere((dynamic user) => user['id'] == id);
    storage = _jsonList;
  }

  /// returns a user if the authentication succeeded, else null
  User? login(String email, String password) {
    currentUser = _users.firstWhere(
      (User user) => user.email == email && user.password == password,
    );
    return currentUser;
  }
}
