import 'package:commerce_hub/feature/checkout/view/widgets/active_step_item.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/out_active_step_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.index,
      required this.text,
      required this.isActive});
  final String index, text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveStepItem(text: text),
      secondChild: OutActiveStepItem(text: text, index: index),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 300),
    );
  }
}
