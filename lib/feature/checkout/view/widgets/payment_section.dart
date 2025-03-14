import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_box_decoration.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/payment_item_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        // payment method title by user
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
          child: PaymentItemTitle(),
        ),
      ],
    );
  }
}
