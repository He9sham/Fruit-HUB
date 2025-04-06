import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:commerce_hub/core/helper/awesome_widgets.dart';
import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/custom_progress_hud.dart';
import 'package:commerce_hub/feature/sign_up/logic/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess) {
          context.pushNamed(
            Routes.navigationBar,
          );
        } else if (state is SignupCubitFailure) {
          awesomeWidgets(
            context,
            DialogType.error,
            'خطأ',
            state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupCubitLoading,
          child: child,
        );
      },
    );
  }
}