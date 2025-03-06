import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Colors.green.shade900,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 15,
          ),
        ),
        horizontalSpace(4),
        Text(
          'الشحن',
          style: TextStyle(
              color: Color(0xff1B5E37),
              fontSize: 13,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
