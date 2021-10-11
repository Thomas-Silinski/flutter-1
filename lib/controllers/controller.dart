import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class AppController extends GetxController {
  abstract String storeId;

  final GetStorage _storage = GetStorage();
  List<dynamic> get storage => _storage.read(storeId);
  set storage(List<dynamic> data) {
    _storage.write(storeId, data);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _storage.writeIfNull(storeId, <dynamic>[]);
  }
}
