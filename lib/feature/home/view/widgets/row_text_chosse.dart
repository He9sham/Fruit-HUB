
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RowTextChosse extends StatelessWidget {
  const RowTextChosse({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: Styles.textbuttom16White.copyWith(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        horizontalSpace(15),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.black.withValues(
                  alpha: 0.3,
                ),
                width: 2),
          ),
        ),
      ],
    );
  }
}
