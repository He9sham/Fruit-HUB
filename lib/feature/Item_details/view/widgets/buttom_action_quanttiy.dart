import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/bottom_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtomActionTest extends StatefulWidget {
  final Function(int)? onQuantityChanged;

  const ButtomActionTest({
    super.key,
    this.onQuantityChanged,
  });

  @override
  State<ButtomActionTest> createState() => _ButtomActionTestState();
}

class _ButtomActionTestState extends State<ButtomActionTest> {
  int quantity = 1;

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.onQuantityChanged?.call(quantity);
      });
    }
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged?.call(quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BottomAction(
          height: 36,
          width: 36,
          icondata: FontAwesomeIcons.minus,
          onTap: _decreaseQuantity,
          color: Color(0xffF1F1F5),
        ),
        horizontalSpace(10),
        Text(
          quantity.toString(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff000000),
          ),
        ),
        horizontalSpace(10),
        BottomAction(
          height: 36,
          width: 36,
          icondata: FontAwesomeIcons.plus,
          onTap: _increaseQuantity,
          color: Color(0xff1B5E37),
        ),
      ],
    );
  }
}
