import 'package:commerce_hub/feature/checkout/view/widgets/step_item.dart';
import 'package:flutter/material.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: List.generate(
        4,
        (index) {
          return Expanded(
            child: StepItem(
              isActive: true,
              index: (index + 1).toString(),
              text: getSteps()[index],
            ),
          );
        },
      ),
    );
  }

  List<String> getSteps() {
    return [
      'الشحن',
      'العنوان',
      'الدفع',
      'المراجعه',
    ];
  }
}
