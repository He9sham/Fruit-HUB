
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginTextFromfield extends StatelessWidget {
  const LoginTextFromfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(25),
        AppTextFormField(
          hintText: 'البريد الإلكتروني',
          validator: (data) {},
          backgroundColor: ColorsManager.lighterGray,
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: 'كلمة المرور',
          validator: (data) {},
          backgroundColor: ColorsManager.lighterGray,
          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
        ),
      ],
    );
  }
}
