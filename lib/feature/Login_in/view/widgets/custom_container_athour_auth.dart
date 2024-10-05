import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerAthourAuth extends StatelessWidget {
  const CustomContainerAthourAuth(
      {super.key,
      required this.title,
      required this.iconData,
      this.color,
      required this.ontap});
  final String title;
  final IconData iconData;
  final Color? color;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 343.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
          border: Border.all(
            color: ColorsManager.lighterGray,
            width: 3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            horizontalSpace(75),
            Text(
              title,
              style: Styles.textRowNavigate16gray.copyWith(color: Colors.black),
            ),
            horizontalSpace(40),
            Icon(
              iconData,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
