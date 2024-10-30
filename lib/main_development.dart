import 'package:commerce_hub/core/utils/app_route.dart';
import 'package:commerce_hub/firebase_options.dart';
import 'package:commerce_hub/fruitHub.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName}: ${rec.level.name} - ${rec.message}');
  });
  runApp(
    CommerceHub(
      appRouter: AppRouter(),
    ),
  );
}
