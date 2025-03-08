import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/check_out_steps.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/check_out_steps_page_view.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
              CheckOutSteps(),
              verticalSpace(32),
              Expanded(
                child: CheckOutStepsPageView(
                  pageController: pageController,
                ),
              ),
              AppTextButton(
                buttonText: 'التالي',
                textStyle: Styles.textbuttom16White,
                onPressed: () {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
