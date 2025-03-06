import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/active_step_item.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              verticalSpace(16),
              CustomAppbar(
                isshowback: true,
                isshowIcon: false,
                spacepadding: 120,
                text: 'الشحن',
              ),
              verticalSpace(16),
              ActiveStepItem()
            ],
          ),
        ),
      ),
    );
  }
}
