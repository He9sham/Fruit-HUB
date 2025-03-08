import 'package:commerce_hub/core/helper/app_regex.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'الاسم كامل',
              validator: (value) {
                return null;
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'البريد الإلكتروني',
              validator: (data) {
                data = data!.trim();
                if (data.isEmpty || !AppRegex.isEmailValid(data)) {
                  return 'الرجاء ادخال البريد الإلكتروني';
                }
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
            verticalSpace(8),
            AppTextFormField(
              keyboardType: TextInputType.number,
              hintText: 'رقم الهاتف',
              validator: (value) {
                return null;
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'العنوان',
              validator: (value) {
                return null;
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'المدينة',
              validator: (value) {
                return null;
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'الرمز البريدي',
              validator: (value) {
                return null;
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'رقم الطابق , رقم الشقه ..',
              validator: (value) {
                return null;
              },
              backgroundColor: ColorsManager.lighterGray,
            ),
          ],
        ),
      ),
    );
  }
}
