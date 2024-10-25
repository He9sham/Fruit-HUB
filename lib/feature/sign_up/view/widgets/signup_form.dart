import 'package:commerce_hub/core/helper/app_regex.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub/feature/sign_up/logic/signup_cubit_cubit.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
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
    return Form(
      key: context.read<SignupCubit>().formkey,
      child: Column(
        children: [
          AppTextFormField(
            keyboardType: TextInputType.name,
            hintText: 'الاسم كامل',
            validator: (data) {
              data = data!.trim();
              if (data.isEmpty) {
                return 'الرجاء ادخال الاسم كامل';
              }
            },
            backgroundColor: ColorsManager.lighterGray,
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            keyboardType: TextInputType.name,
            hintText: 'البريد الإلكتروني',
            validator: (data) {
              data = data!.trim();
              if (data.isEmpty || !AppRegex.isEmailValid(data)) {
                return 'الرجاء ادخال البريد الإلكتروني';
              }
            },
            backgroundColor: ColorsManager.lighterGray,
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextFormField(
            keyboardType: TextInputType.name,
            hintText: 'كلمة المرور',
            validator: (data) {
              data = data!.trim();
              if (data.isEmpty) {
                return 'الرجاء ادخال كلمة المرور';
              }
            },
            backgroundColor: ColorsManager.lighterGray,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            controller: context.read<SignupCubit>().passwordController,
            isObscureText: isPasswordObscureText,
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
      ),
    );
  }
}
