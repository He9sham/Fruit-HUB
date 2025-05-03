import 'dart:developer';

import 'package:commerce_hub/core/utils/app_keys.dart';
import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:commerce_hub/feature/checkout/logic/add_order_cubit/add_order_cubit.dart';
import 'package:commerce_hub/feature/checkout/view/checkout_view.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/error_method_with_paypal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

/// Handles the payment method selection and processing.
/// If cash payment is selected, it directly adds the order.
void paymentMethodHandler(BuildContext context) {
  var ordeEntitys = context.read<OrderInputEntity>();
  var addOrderCubit = context.read<AddOrderCubit>();

  // Check if user selected cash payment
  if (ordeEntitys.payWithcach == true) {
    // Skip PayPal payment and directly add the order
    addOrderCubit.addOrder(order: ordeEntitys);

    // Track successful cash checkout
    trackCheckoutEvent(ordeEntitys);

    showSnackBar(context, 'تم تأكيد الطلب بنجاح');
    Navigator.pop(context);
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
          trackCheckoutEvent(ordeEntitys);

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
