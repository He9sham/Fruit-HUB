import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:commerce_hub/core/helper/awesome_widgets.dart';
import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/custom_progress_hud.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushNamed(
            Routes.navigationBar,
          );
        } else if (state is LoginFailer) {
          awesomeWidgets(
            context,
            DialogType.error,
            'خطأ',
            state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LoginLoading,
          child: child,
        );
      },
    );
  }
}
