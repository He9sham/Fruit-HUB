
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentAddress extends StatelessWidget {
  const PaymentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(8),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'عنوان التوصيل',
              textDirection: TextDirection.rtl,
              style: Styles.textSize13Black600
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Image.asset('assets/image/edit.png'),
            Text(
              'تعديل',
              textDirection: TextDirection.rtl,
              style: Styles.textSize13Black600.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(
              FontAwesomeIcons.locationDot,
              size: 16,
            ),
            Text(
              'شارع النيل، مبنى رقم ١٢٣، الطابق الثاني، شقة رقم ٤',
              textDirection: TextDirection.rtl,
              style: Styles.textSize13Black600.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}