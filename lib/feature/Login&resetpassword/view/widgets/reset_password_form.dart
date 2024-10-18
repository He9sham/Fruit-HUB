import 'package:commerce_hub/core/helper/app_regex.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/reset_password/cubit/resetpassword_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetpasswordCubit>().formkey,
      child: Column(
        children: [
          AppTextFormField(
            keyboardType: TextInputType.name,
            hintText: 'البريد الإلكتروني',
            validator: (data) {
              data = data!.trim();
              if (data.isEmpty || !AppRegex.isEmailValid(data)) {
                return 'الرجاء ادخال البريد الإلكتروني';
              }
            },
            backgroundColor: ColorsManager.lighterGray,
            controller: context.read<ResetpasswordCubit>().resetemailController,
          ),
        ],
      ),
    );
  }
}
