import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/custom_appbar_for_auth.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/row_text_reauth.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/rowtext_check_box.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
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
                  title: 'حساب جديد',
                  onPressed: () {
                    context.pop();
                  },
                ),
                verticalSpace(24),
                const SignupForm(),
                verticalSpace(16),
                const RowTextCheckBox(),
                verticalSpace(30),
                AppTextButton(
                  buttonText: 'إنشاء حساب جديد',
                  onPressed: () {},
                  textStyle: Styles.textbuttom16White,
                ),
                verticalSpace(26),
                RowTextReauth(
                  title: 'تسجيل الدخول',
                  subtitle: 'تمتلك حساب بالفعل؟',
                  onPressed: () {
                    context.pushNamed(Routes.loginScreen);
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