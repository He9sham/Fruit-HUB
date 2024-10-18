import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:commerce_hub/core/helper/awesome_widgets.dart';
import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccess ||
          current is LoginFailer ||
          current is LoginLoading,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushNamed(
            Routes.homeScreen,
          );
        } else if (state is LoginFailer) {
          awesomeWidgets(
            context,
            DialogType.error,
            'خطأ',
            state.errMessage,
          );
        } else if (state is LoginLoading) {
          LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color(0xFFEA3799),
            size: 200,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
