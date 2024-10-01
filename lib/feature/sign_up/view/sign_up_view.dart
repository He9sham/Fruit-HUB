import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/custom_appbar_for_auth.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/rowtext_check_box.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
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
                title: 'حساب جديد',
                onPressed: () {
                  context.pop();
                },
              ),
              verticalSpace(24),
              const SignupForm(),
              verticalSpace(16),
              const RowTextCheckBox(),
            ],
          ),
        ),
      ),
    );
  }
}
