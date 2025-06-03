import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AboutItem extends StatelessWidget {
  const AboutItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.w,
          color: Colors.black.withValues(alpha: 0.2),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: 40.w,
            child: SvgPicture.asset(image),
          ),
          Positioned(
            top: 15.h,
            left: 85.w,
            child: Text(
              title,
              style: Styles.textRowNavigate16gray.copyWith(
                color: Color(0xff23AA49),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 85.w,
            child: Text(
              subTitle,
              style: Styles.textSize13Black600.copyWith(
                color: Color(0xff979899),
              ),
            ),
          )
        ],
      ),
    );
  }
}
