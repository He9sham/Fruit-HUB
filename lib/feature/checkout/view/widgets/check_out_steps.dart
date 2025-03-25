import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/step_item.dart';
import 'package:flutter/material.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps(
      {super.key, required this.currentPageStep, required this.pageController});
  final int currentPageStep;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: List.generate(
        getSteps().length,
        (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (index <= currentPageStep) {
                  pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else if (index > currentPageStep) {
                  if (currentPageStep == 0) {
                    showSnackBar(context, 'يرجى إكمال قسم الشحن أولاً');
                  } else if (currentPageStep == 1) {
                    showSnackBar(context, 'يرجى إكمال قسم العنوان أولاً');
                  }
                }
              },
              child: StepItem(
                isActive: index <= currentPageStep,
                index: (index + 1).toString(),
                text: getSteps()[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> getSteps() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
