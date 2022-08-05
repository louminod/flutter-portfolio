import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

abstract class CustomLogger {
  static Future<void> error(error, stackTrace, reason, fatal) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: reason, fatal: fatal);
    if (kDebugMode) {
      print(error);
    }
  }

  static void i() {}
}
