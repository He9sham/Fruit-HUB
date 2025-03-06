import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:commerce_hub/feature/home/logic/cart_item_cubit/cartitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderCartButton extends StatelessWidget {
  const BlocBuilderCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartitemCubit, CartitemState>(
      buildWhen: (previous, current) {
        return current is CartitemUpdate;
      },
      builder: (context, state) {
        return AppTextButton(
          buttonText:
              ' الدفع ${context.watch<CartProductCubit>().cartEntity.calculateTotalPrice()} جنيه',
          onPressed: () {
            if (context
                .read<CartProductCubit>()
                .cartEntity
                .cartItems
                .isNotEmpty) {
              Navigator.pushNamed(context, Routes.checkout);
              // push to payment screen
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('السلة فارغة'),
                ),
              );
            }
          },
          textStyle: Styles.textbuttom16White,
        );
      },
    );
  }
}
