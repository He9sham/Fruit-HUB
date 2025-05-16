import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/bottom_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtomActionTest extends StatelessWidget {
  const ButtomActionTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BottomAction(
          height: 36,
          width: 36,
          icondata: FontAwesomeIcons.minus,
          onTap: () {
            // if (cartItemEntity.quantity > 1) {
            //   cartItemEntity.deccreaseCount();
            // } else {
            //   context.read<CartProductCubit>().removeProduct(cartItemEntity);
            // }
            // context.read<CartitemCubit>().updateCartItem(cartItemEntity);
          },
          color: Color(0xffF1F1F5),
        ),
        horizontalSpace(10),
        Text(
          '1',
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
          onTap: () {
            // cartItemEntity.increaseCount();
            // context.read<CartitemCubit>().updateCartItem(cartItemEntity);
          },
          color: Color(0xff1B5E37),
        ),
      ],
    );
  }
}
