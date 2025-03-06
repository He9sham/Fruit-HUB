import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/domain/cart_item_entity.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:commerce_hub/feature/home/logic/cart_item_cubit/cartitem_cubit.dart';
import 'package:commerce_hub/feature/home/view/widgets/bottom_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                context.read<CartProductCubit>().removeProduct(cartItemEntity);
              },
              icon: Icon(FontAwesomeIcons.trash),
            ),
            verticalSpace(16),
            Text(
              textDirection: TextDirection.rtl,
              '${cartItemEntity.calculateTotalPrice()} جنيه',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              cartItemEntity.productInputEntity.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            verticalSpace(8),
            Text(
              textDirection: TextDirection.rtl,
              '${cartItemEntity.calculateTotalWeight()} كم',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.orange,
              ),
            ),
            verticalSpace(6),
            Row(
              children: [
                BottomAction(
                  icondata: FontAwesomeIcons.minus,
                  onTap: () {
                    if (cartItemEntity.count > 1) {
                      cartItemEntity.deccreaseCount();
                    } else {
                      context
                          .read<CartProductCubit>()
                          .removeProduct(cartItemEntity);
                    }
                    context
                        .read<CartitemCubit>()
                        .updateCartItem(cartItemEntity);
                  },
                  color: Color(0xffFFA451),
                ),
                horizontalSpace(10),
                Text(
                  cartItemEntity.count.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                ),
                horizontalSpace(10),
                BottomAction(
                  icondata: FontAwesomeIcons.plus,
                  onTap: () {
                    cartItemEntity.increaseCount();
                    context
                        .read<CartitemCubit>()
                        .updateCartItem(cartItemEntity);
                  },
                  color: Color(0xffFFA451),
                ),
              ],
            )
          ],
        ),
        horizontalSpace(16),
        Container(
          height: 92.h,
          width: 73.w,
          decoration: BoxDecoration(
            color: Color(0xffF3F5F7),
          ),
          child: Center(
            child: Image.network(
              cartItemEntity.productInputEntity.imageUrl!,
              height: 45,
            ),
          ),
        ),
      ],
    );
  }
}
