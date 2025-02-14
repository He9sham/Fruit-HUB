import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.isshowIcon,
    required this.spacepadding,
    required this.text,
  });
  final bool isshowIcon;
  final double spacepadding;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(20),
        Visibility(
          visible: isshowIcon,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withValues(alpha: 0.2),
            ),
            child: const Icon(
              FontAwesomeIcons.bell,
              size: 20,
            ),
          ),
        ),
        horizontalSpace(spacepadding),
        Text(
          text,
          style: Styles.textappBar,
        ),
      ],
    );
  }
}
