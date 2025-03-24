import 'package:commerce_hub/feature/checkout/view/widgets/address_section.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/payment_section.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({super.key, required this.pageController, required this.formKey, required this.valueListenable});
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final  ValueListenable<AutovalidateMode> valueListenable;
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
      AddressSection(
        valueListenable: valueListenable, 
        formKey: formKey,
      ),
      PaymentSection(),
    ];
  }
}
