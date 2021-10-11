import 'dart:math';
import 'dart:convert';

String randomId(int len) {
  Random random = Random.secure();
  List<int> values = List<int>.generate(len, (int i) => random.nextInt(255));
  return base64UrlEncode(values);
}

abstract class Model {
  String id;

  Model(String? id) : id = id ?? randomId(15);
}
