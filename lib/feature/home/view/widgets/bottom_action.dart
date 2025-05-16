
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomAction extends StatelessWidget {
  const BottomAction(
      {super.key,
      required this.icondata,
      required this.onTap,
      required this.color, required this.height, required this.width});
  final IconData icondata;
  final void Function() onTap;
  final Color color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Icon(
            icondata,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}