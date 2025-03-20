import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/login_cubit/login_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/widgets/custom_container_athour_auth.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/widgets/divider_row.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/widgets/login_bloc_listener.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/widgets/login_text_from_field.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/custom_appbar_for_auth.dart';
import 'package:commerce_hub/feature/sign_up/view/widgets/row_text_reauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  textspace: 120,
                  iconspace: 60,
                  title: 'تسجيل دخول',
                  onPressed: () {
                    context.pop();
                  },
                ),
                const LoginTextFromfield(),
                verticalSpace(16),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.resetPasswordScreen);
                      },
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
                  onPressed: () {
                    validateThenDoSignup(context);
                    
                  },
                  textStyle: Styles.textbuttom16White,
                ),
                verticalSpace(33),
                RowTextReauth(
                  title: 'قم بانشاء حساب',
                  subtitle: 'لا تمتلك حساب؟',
                  onPressed: () {
                    context.pushNamed(Routes.signupScreen);
                  },
                ),
                verticalSpace(37),
                const DividerRow(),
                verticalSpace(37),
                CustomContainerAthourAuth(
                  ontap: () {},
                  title: 'تسجيل دخول بفيس بوك   ',
                  iconData: FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                verticalSpace(16),
                CustomContainerAthourAuth(
                  title: '   تسجيل بواسطة جوجل   ',
                  iconData: FontAwesomeIcons.google,
                  ontap: () {
                    context.read<LoginCubit>().signInWithGoogle(context);
                  },
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<LoginCubit>().formkey.currentState!.validate()) {
      context.read<LoginCubit>().loginMethod();
    }
  }
}
