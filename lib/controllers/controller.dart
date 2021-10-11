import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class AppController extends GetxController {
  final GetStorage _storage = GetStorage();
  abstract String storeId;

  // todo: may not be a list, for exemple current loggedIn user controller
  List<dynamic> get storage => _storage.read(storeId);

  set storage(List<dynamic> data) {
    _storage.write(storeId, data);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _storage.writeIfNull(storeId, <dynamic>[]);
    restore();
  }

  /// Populates the controller from the local storage
  void restore();
}
