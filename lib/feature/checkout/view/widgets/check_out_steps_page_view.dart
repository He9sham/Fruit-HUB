import 'package:commerce_hub/feature/checkout/view/widgets/address_section.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/payment_section.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/review_section.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressSection(),
      PaymentSection(),
      ReviewSection(),
    ];
  }
}
