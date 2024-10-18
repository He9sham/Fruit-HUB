import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:commerce_hub/core/helper/awesome_widgets.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/reset_password/cubit/resetpassword_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetpasswordCubit, ResetpasswordState>(
      listenWhen: (previous, current) =>
          current is ResetpasswordLoading ||
          current is ResetpasswordSuccess ||
          current is ResetpasswordFailure,
      listener: (context, state) {
        if (state is ResetpasswordSuccess) {
          awesomeWidgets(context, DialogType.success, 'تم',
              'لقد وصلتك رساله لتعين كلمة مرور جديدة');
        } else if (state is ResetpasswordLoading) {
          const CircularProgressIndicator();
        } else if (state is ResetpasswordFailure) {
          awesomeWidgets(
            context,
            DialogType.error,
            'خطأ',
            state.errMessage,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
