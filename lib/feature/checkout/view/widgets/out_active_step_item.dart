import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class OutActiveStepItem extends StatelessWidget {
  const OutActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xffF2F3F3),
          child: Text(
            index,
            style: TextStyle(
                color: Color(0xff0C0D0D),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ),
        horizontalSpace(4),
        Text(
          'العنوان',
          style: TextStyle(
              color: Color(0xffAAAAAA),
              fontSize: 13,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
