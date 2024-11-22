import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RowTextCheckBox extends StatefulWidget {
  const RowTextCheckBox({super.key});

  @override
  State<RowTextCheckBox> createState() => _RowTextCheckBoxState();
}

bool isChecked = true;

class _RowTextCheckBoxState extends State<RowTextCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على',
                style: Styles.textSize13Black600,
              ),
              TextSpan(
                text: ' الشروط والاحكام',
                style: Styles.textSize13gree600,
              )
            ],
          ),
        ),
        Checkbox(
          value: isChecked, // Initialize with a boolean value
          activeColor: Colors.green,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue ?? false;
            });
          },
        ),
      ],
    );
  }
}
