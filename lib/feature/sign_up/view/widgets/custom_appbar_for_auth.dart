import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarForAuth extends StatelessWidget {
  const CustomAppBarForAuth({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(130),
        Text(
          title,
          style: Styles.textappBarAuth,
        ),
        horizontalSpace(80),
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
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
