import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class AppController extends GetxController {
  final GetStorage _storage = GetStorage();
  abstract String storeId;

  List<dynamic> get storage => _storage.read(storeId);

  set storage(List<dynamic> data) {
    _storage.write(storeId, data);
  }

  @override
  void onInit() {
    _storage.writeIfNull(storeId, <dynamic>[]);
    super.onInit();
  }
}
