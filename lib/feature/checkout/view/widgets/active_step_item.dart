import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
          text,
          style: TextStyle(
              color: Color(0xff1B5E37),
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
