import 'package:commerce_hub/core/service/shared_preferences_singleton.dart';
import 'package:commerce_hub/core/utils/app_route.dart';
import 'package:commerce_hub/firebase_options.dart';
import 'package:commerce_hub/fruitHub.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  runApp(
    CommerceHub(
      appRouter: AppRouter(),
    ),
  );
}
