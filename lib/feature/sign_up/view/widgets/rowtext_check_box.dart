
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RowTextCheckBox extends StatelessWidget {
  const RowTextCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
          value: true,
          activeColor: Colors.green,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
