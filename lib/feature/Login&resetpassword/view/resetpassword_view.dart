import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/reset_password/cubit/resetpassword_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/widgets/reset_password_bloc_listener.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/widgets/reset_password_form.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/custom_appbar_for_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetpasswordView extends StatelessWidget {
  const ResetpasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              verticalSpace(16),
              CustomAppBarForAuth(
                textspace: 105,
                iconspace: 25,
                title: 'نسيان كلمة المرور    ',
                onPressed: () {
                  context.pop();
                },
              ),
              verticalSpace(28),
              Text(
                '.لا تقلق ، ما عليك سوى كتابة البريدالالكتروني وسنرسل رمز التحقق',
                style: Styles.textRowNavigate16gray.copyWith(fontSize: 13),
              ),
              verticalSpace(31),
              const ResetPasswordForm(),
              verticalSpace(30),
              AppTextButton(
                buttonText: 'نسيت كلمة المرور',
                onPressed: () {
                  if (context
                      .read<ResetpasswordCubit>()
                      .formkey
                      .currentState!
                      .validate()) {
                    context.read<ResetpasswordCubit>().resetPassword();
                  }
                },
                textStyle: Styles.textbuttom16White,
              ),
              const ResetPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
