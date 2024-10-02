import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/custom_appbar_for_auth.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/row_text_reauth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(16),
                CustomAppBarForAuth(
                  title: 'تسجيل دخول',
                  onPressed: () {
                    context.pop();
                  },
                ),
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
                verticalSpace(16),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: Styles.textRowNavigate16green
                            .copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                verticalSpace(33),
                AppTextButton(
                  buttonText: 'تسجيل الدخول',
                  onPressed: () {},
                  textStyle: Styles.textbuttom16White,
                ),
                verticalSpace(33),
                RowTextReauth(
                  title: 'قم بانشاء حساب',
                  subtitle: 'لا تمتلك حساب؟',
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
