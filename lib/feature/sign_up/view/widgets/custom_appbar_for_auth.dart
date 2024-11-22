import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarForAuth extends StatelessWidget {
  const CustomAppBarForAuth(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.iconspace,
      required this.textspace});

  final String title;
  final void Function() onPressed;
  final double iconspace, textspace;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        horizontalSpace(textspace),
        Text(
          title,
          style: Styles.textappBarAuth,
        ),
        horizontalSpace(iconspace),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}
