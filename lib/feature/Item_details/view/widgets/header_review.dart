
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class HeaderReview extends StatelessWidget {
  const HeaderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'المراجعه',
          style: Styles.textSize13gree600.copyWith(
            color: Color(0xff1B5E37),
            fontWeight: FontWeight.w700,
          ),
        ),
        horizontalSpace(9),
        Text(
          '(30+)',
          style: Styles.textSize13gree600.copyWith(
            color: Color(0xff000000),
          ),
        ),
        horizontalSpace(9),
        Text(
          '4.8',
          style: Styles.textSize13gree600.copyWith(
            color: Colors.black,
          ),
        ),
        horizontalSpace(4),
        Icon(
          Icons.star,
          color: Color(0xffF4A91F),
        ),
      ],
    );
  }
}