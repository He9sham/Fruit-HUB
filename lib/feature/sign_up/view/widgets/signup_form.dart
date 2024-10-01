import 'package:commerce_hub/core/helper/app_regex.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/password_validations.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          keyboardType: TextInputType.name,
          hintText: 'الاسم كامل',
          validator: (data) {},
          backgroundColor: ColorsManager.lighterGray,
        ),
        verticalSpace(16),
        AppTextFormField(
          keyboardType: TextInputType.name,
          hintText: 'البريد الإلكتروني',
          validator: (data) {},
          backgroundColor: ColorsManager.lighterGray,
        ),
        verticalSpace(16),
        AppTextFormField(
          keyboardType: TextInputType.name,
          hintText: 'كلمة المرور',
          validator: (data) {},
          backgroundColor: ColorsManager.lighterGray,
          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
        ),
        verticalSpace(24),
        PasswordValidations(
          hasLowerCase: hasLowercase,
          hasUpperCase: hasUppercase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }
}
