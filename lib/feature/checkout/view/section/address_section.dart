import 'package:commerce_hub/core/helper/app_regex.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatelessWidget {
  const AddressSection(
      {super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: ValueListenableBuilder<AutovalidateMode>(
          valueListenable: valueListenable,
          builder: (context, value, child) => Form(
            key: formKey,
            autovalidateMode: value,
            child: Column(
              children: [
                AppTextFormField(
                  onsaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddressEntity!
                        .name = value;
                  },
                  hintText: 'الاسم كامل',
                  validator: (value) {
                    return value?.isEmpty ?? true ? 'الرجاء ادخال الاسم' : null;
                  },
                  backgroundColor: ColorsManager.lighterGray,
                ),
                verticalSpace(8),
                AppTextFormField(
                  onsaved: (p0) => context
                      .read<OrderInputEntity>()
                      .shippingAddressEntity!
                      .email = p0,
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
                  onsaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddressEntity!
                        .phone = value;
                  },
                  keyboardType: TextInputType.number,
                  hintText: 'رقم الهاتف',
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'الرجاء ادخال رقم هاتف'
                        : null;
                  },
                  backgroundColor: ColorsManager.lighterGray,
                ),
                verticalSpace(8),
                AppTextFormField(
                  onsaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddressEntity!
                        .address = value;
                  },
                  hintText: 'العنوان',
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'الرجاء ادخال العنوان'
                        : null;
                  },
                  backgroundColor: ColorsManager.lighterGray,
                ),
                verticalSpace(8),
                AppTextFormField(
                  onsaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddressEntity!
                        .city = value;
                  },
                  hintText: 'المدينة',
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'الرجاء ادخال المدينة'
                        : null;
                  },
                  backgroundColor: ColorsManager.lighterGray,
                ),
                verticalSpace(8),
                AppTextFormField(
                  keyboardType: TextInputType.number,
                  onsaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddressEntity!
                        .post = value;
                  },
                  hintText: 'الرمز البريدي',
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'الرجاء ادخال الرمز البريدي'
                        : null;
                  },
                  backgroundColor: ColorsManager.lighterGray,
                ),
                verticalSpace(8),
                AppTextFormField(
                  keyboardType: TextInputType.number,
                  onsaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddressEntity!
                        .floor = value;
                  },
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'الرجاء ادخال رقم الطابق'
                        : null;
                  },
                  backgroundColor: ColorsManager.lighterGray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
