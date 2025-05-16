
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidgetForDescription extends StatelessWidget {
  const TextWidgetForDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 63.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Text(
        textAlign: TextAlign.right,
        'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
        style: Styles.textSize13gree600.copyWith(
            color: Color(0xff979899),
            fontWeight: FontWeight.w400,
            fontSize: 14.sp),
      ),
    );
  }
}
