import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'ملخص الطلب :',
              textDirection: TextDirection.rtl,
              style: Styles.textSize13Black600,
            ),
          ],
        ),
        verticalSpace(8),
        Container(
          height: 130.h,
          width: 345.w,
          decoration: AppDecorations.greyBoxDecoration,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    '150 جنيه',
                    style: Styles.textSize13Black600.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    textDirection: TextDirection.rtl,
                    'المجموع الفرعي :',
                    style: Styles.textSize13Black600,
                  ),
                ],
              ),
              verticalSpace(9),
              Row(
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    '30 جنيه',
                    style: Styles.textSize13Black600.copyWith(
                      color: Color(0xff4E5556),
                    ),
                  ),
                  Spacer(),
                  Text(
                    textDirection: TextDirection.rtl,
                    'التوصيل :',
                    style: Styles.textSize13Black600.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4E5556),
                    ),
                  ),
                ],
              ),
              verticalSpace(9),
              Divider(
                color: Color(0xff4E5556),
                thickness: .5,
                endIndent: 25,
                indent: 25,
              ),
              verticalSpace(9),
              Row(
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    '180 جنيه',
                    style: Styles.textSize13Black600.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    textDirection: TextDirection.rtl,
                    'المجموع الكلي :',
                    style: Styles.textSize13Black600,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
