import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/feature/sign_up/logic/signup_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupCubitState>(
      listenWhen: (previous, current) {
        return current is SignupCubitSuccess ||
            current is SignupCubitFailure ||
            current is SignupCubitLoading;
      },
      listener: (context, state) {
        if (state is SignupCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        } else if (state is SignupCubitSuccess) {
          context.pushNamed(
            Routes.homeScreen,
          );
        } else if (state is SignupCubitLoading) {
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
