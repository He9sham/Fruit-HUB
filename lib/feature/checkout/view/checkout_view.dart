import 'dart:developer';

import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/service/analytics_service.dart';
import 'package:commerce_hub/core/service/get_it_service.dart';
import 'package:commerce_hub/core/service/get_user.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/utils/app_keys.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:commerce_hub/feature/checkout/logic/add_order_cubit/add_order_cubit.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/add_order_cubit_bloc_builder.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/check_out_steps.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/check_out_steps_page_view.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  // Reference to the analytics service
  final AnalyticsService _analyticsService = getIt<AnalyticsService>();

  late PageController pageController;
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    orderEntity = OrderInputEntity(widget.cartEntity, uId: getuser().uid);
    pageController.addListener(() {
      setState(() {
        currentPageStep = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    autoValidateMode.dispose();
    super.dispose();
  }

  // Track checkout analytics event
  void _trackCheckoutEvent(OrderInputEntity orderEntity) {
    final double totalAmount =
        orderEntity.calculateTotalPriceAfterDiscountAndShipping();
    final products = orderEntity.cartEntity.cartItems
        .map((item) => item.productInputEntity)
        .toList();

    _analyticsService.trackCheckout(totalAmount, products);
  }

  int currentPageStep = 0;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> autoValidateMode =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  @override
  Widget build(BuildContext context) {
    return AddOrderCubitBlocBuilder(
      child: Scaffold(
        body: SafeArea(
          child: Provider.value(
            value: orderEntity,
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
                      valueListenable: autoValidateMode,
                      formKey: formKey,
                      pageController: pageController,
                    ),
                  ),
                  Builder(
                    builder: (context) => AppTextButton(
                      buttonText: getNextButtonText(currentPageStep),
                      textStyle: Styles.textbuttom16White,
                      onPressed: () {
                        if (currentPageStep == 0) {
                          _handelShippingSectionValidate();
                        } else if (currentPageStep == 1) {
                          _handelAddresSectionValidate();
                        } else {
                          paymentMethodHandler(context);
                          var orderEntity = context.read<OrderInputEntity>();
                          context
                              .read<AddOrderCubit>()
                              .addOrder(order: orderEntity);

                          // Track checkout event
                          _trackCheckoutEvent(orderEntity);
                        }
                      },
                    ),
                  ),
                  verticalSpace(50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handelShippingSectionValidate() {
    pageController.animateToPage(
      currentPageStep + 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
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

  void _handelAddresSectionValidate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageStep + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      autoValidateMode.value = AutovalidateMode.always;
    }
  }

  void paymentMethodHandler(BuildContext context) {
    var ordeEntitys = context.read<OrderInputEntity>();
    var addOrderCubit = context.read<AddOrderCubit>();

    // Check if user selected cash payment
    if (ordeEntitys.payWithcach == true) {
      // Skip PayPal payment and directly add the order
      addOrderCubit.addOrder(order: ordeEntitys);

      // Track successful cash checkout
      _trackCheckoutEvent(ordeEntitys);

      showSnackBar(context, 'تم تأكيد الطلب بنجاح');
      return;
    } else if (ordeEntitys.payWithcach == false) {
      // If PayPal is not selected, show a message
      PaypalPaymentEntity paymentEntity =
          PaypalPaymentEntity.fromEntity(ordeEntitys);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: clientId,
          secretKey: secret,
          transactions: [
            paymentEntity.toJson(),
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            addOrderCubit.addOrder(order: ordeEntitys);

            // Track successful PayPal checkout
            _trackCheckoutEvent(ordeEntitys);

            showSnackBar(context, 'تم الدفع بنجاح');
          },
          onError: (error) {
            errorMethodWithPaypal(error, context);
          },
          onCancel: () {
            Navigator.pop(context);
            showSnackBar(context, 'تم إلغاء الدفع');
          },
        ),
      ));
      showSnackBar(context, 'يرجى اختيار طريقة الدفع');
      return;
    }

    // For online payment, proceed with PayPal
  }

  /// Handles the error response from PayPal payment
  /// and displays an appropriate message to the user.
  void errorMethodWithPaypal(error, BuildContext context) {
    log("onError: $error");
    Navigator.pop(context);

    // Parse the error to extract more specific information
    String errorMessage = 'حدث خطأ ما';

    try {
      if (error is Map) {
        // Check if it's a compliance violation error
        if (error['data'] != null &&
            error['data']['name'] == 'COMPLIANCE_VIOLATION') {
          errorMessage =
              'تم رفض المعاملة بسبب انتهاك الامتثال. يرجى التحقق من تفاصيل الدفع الخاصة بك أو الاتصال بدعم PayPal.';

          // Log more detailed information for debugging
          log("Compliance violation details: ${error['data']['message']}");
          log("More info: ${error['data']['information_link']}");
          log("Debug ID: ${error['data']['debug_id']}");
        } else if (error['message'] != null) {
          // Extract the general error message if available
          errorMessage = 'فشل الدفع: ${error['message']}';
        }
      }
    } catch (e) {
      // If error parsing fails, fall back to generic message
      log("Error parsing PayPal error: $e");
    }

    showSnackBar(context, errorMessage);
  }
}
