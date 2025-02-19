import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:flutter/material.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'الأكثر مبيعًا',
          style: Styles.textbuttom16White.copyWith(color: Colors.black),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.bestsellerview);
          },
          child: Text(
            'المزيد  ',
            style: Styles.textonbording13.copyWith(
                color: const Color(0xff949D9E), fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
