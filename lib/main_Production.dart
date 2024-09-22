import 'package:commerce_hub/core/notification_service/local_notification_service.dart';
import 'package:commerce_hub/fruitHub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  NotificationService services = NotificationService();
  await services.init();
  await ScreenUtil.ensureScreenSize();
  runApp(
    const CommerceHub(),
  );
}
