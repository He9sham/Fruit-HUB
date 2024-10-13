import 'package:commerce_hub/core/helper/app_regex.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub/feature/Login_in/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTextFromfield extends StatefulWidget {
  const LoginTextFromfield({super.key});

  @override
  State<LoginTextFromfield> createState() => _LoginTextFromfieldState();
}

bool isPasswordObscureText = true;

class _LoginTextFromfieldState extends State<LoginTextFromfield> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formkey,
      child: Column(
        children: [
          verticalSpace(25),
          AppTextFormField(
            hintText: 'البريد الإلكتروني',
            validator: (data) {
              data = data!.trim();
              if (data.isEmpty || !AppRegex.isEmailValid(data)) {
                return 'الرجاء ادخال البريد الإلكتروني';
              }
            },
            backgroundColor: ColorsManager.lighterGray,
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextFormField(
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
            controller: context.read<LoginCubit>().passwordController,
            isObscureText: isPasswordObscureText,
          ),
        ],
      ),
    );
  }
}
