import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/checkout/domain/order_entity.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/check_out_steps.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/check_out_steps_page_view.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageStep = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider.value(
          value: OrderEntity(widget.cartEntity),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(16),
                CustomAppbar(
                  isshowback: true,
                  isshowIcon: false,
                  spacepadding: 120,
                  text: getNextAppbarText(currentPageStep),
                ),
                verticalSpace(16),
                CheckOutSteps(
                  pageController: pageController,
                  currentPageStep: currentPageStep,
                ),
                verticalSpace(32),
                Expanded(
                  child: CheckOutStepsPageView(
                    pageController: pageController,
                  ),
                ),
                AppTextButton(
                  buttonText: getNextButtonText(currentPageStep),
                  textStyle: Styles.textbuttom16White,
                  onPressed: () {
                    pageController.animateToPage(
                      currentPageStep + 1,
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
      ),
    );
  }

  String getNextButtonText(int currentPageStep) {
    if (currentPageStep == 0) {
      return 'التالي';
    } else if (currentPageStep == 1) {
      return 'التالي';
    } else {
      return 'تأكيد الطلب';
    }
  }

  String getNextAppbarText(int currentPageStep) {
    if (currentPageStep == 0) {
      return 'الشحن';
    } else if (currentPageStep == 1) {
      return 'العنوان';
    } else {
      return 'الدفع';
    }
  }
}
