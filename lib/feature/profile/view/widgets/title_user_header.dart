import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/service/get_user.dart';
import 'package:flutter/material.dart';

class TitleUserHeader extends StatelessWidget {
  const TitleUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade200,
          child: const Icon(
            Icons.person,
            color: Colors.black,
            size: 30,
          ),
        ),
        horizontalSpace(10),
        Column(
          children: [
            Text(
              getuser().name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getuser().email,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
