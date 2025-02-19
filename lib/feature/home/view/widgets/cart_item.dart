import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.trash),
            ),
            verticalSpace(16),
            Text(
              textDirection: TextDirection.rtl,
              '60 جنيه',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              'فروله',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            verticalSpace(8),
            Text(
              textDirection: TextDirection.rtl,
              '3 كم',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.orange,
              ),
            ),
            verticalSpace(6),
            Row(
              children: [
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFF3F5F7),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                ),
                horizontalSpace(10),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xff1B5E37),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        horizontalSpace(16),
        Container(
          height: 92.h,
          width: 73.w,
          decoration: BoxDecoration(
            color: Color(0xffF3F5F7),
          ),
          child: Center(
            child: Image.asset(
              'assets/image/image 29.png',
              height: 45,
            ),
          ),
        ),
      ],
    );
  }
}
