
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RowTextReauth extends StatelessWidget {
  const RowTextReauth(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String title, subtitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: Styles.textRowNavigate16green,
          ),
        ),
        Text(
          subtitle,
          style: Styles.textRowNavigate16gray,
        ),
      ],
    );
  }
}
