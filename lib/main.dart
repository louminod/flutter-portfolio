import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/utils/custom_logger.dart';

void main() async {
  debugPaintSizeEnabled = false;

  WidgetsFlutterBinding.ensureInitialized();

  // await _initFirebase();

  try {
    runApp(const App());
  } catch (error, stackTrace) {
    CustomLogger.error("Can't launch the app", stackTrace, error, true);
  }
}

_initFirebase() async {
  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // FirebaseCrashlytics.instance.crash();
}
