import 'package:get/get.dart';
import 'package:project/models/user.dart';

import 'controller.dart';

typedef JsonUser = Map<String, String>;
typedef JsonUserList = List<JsonUser>;

class UserController extends AppController {
  @override
  String storeId = 'users';

  final List<User> users = <User>[].obs;
  List<dynamic> _jsonList = <dynamic>[];

  @override
  void onInit() {
    _restoreUsers();
    super.onInit();
  }

  void addAndStoreUser(User user) {
    users.add(user);

    _jsonList.add(<String, String>{
      'name': user.name,
      'email': user.email,
      'id': user.id,
    });
    storage = _jsonList;
  }

  /// Populates the controller from the local storage
  void _restoreUsers() {
    _jsonList = storage;

    for (final dynamic user in _jsonList) {
      users.add(User(
        name: user['name'],
        email: user['email'],
        id: user['id'],
      ));
    }
  }
}
