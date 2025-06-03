
  import 'dart:developer';

import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

/// Handles the error response from PayPal payment
  /// and displays an appropriate message to the user.
  void errorMethodWithPaypal( error, BuildContext context) {
 
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

