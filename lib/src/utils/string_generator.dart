import 'package:uuid/uuid.dart';

abstract class StringGenerator {
  static String generateReference() {
    return const Uuid().v1().split("-")[0];
  }
}
