import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/domain/cart_item_entity.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                context.read<CartCubit>().removeProduct(widget.cartItemEntity);
              },
              icon: Icon(FontAwesomeIcons.trash),
            ),
            verticalSpace(16),
            Text(
              textDirection: TextDirection.rtl,
              '${widget.cartItemEntity.calculateTotalPrice()} جنيه',
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
              widget.cartItemEntity.productInputEntity.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            verticalSpace(8),
            Text(
              textDirection: TextDirection.rtl,
              '${widget.cartItemEntity.calculateTotalWeight()} كم',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.orange,
              ),
            ),
            verticalSpace(6),
            Row(
              children: [
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFF3F5F7),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.cartItemEntity.deccreaseCount();
                        });
                      },
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(
                  '${widget.cartItemEntity.count}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                ),
                horizontalSpace(10),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xff1B5E37),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.cartItemEntity.increaseCount();
                        });
                      },
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
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
              widget.cartItemEntity.productInputEntity.imageUrl!,
              height: 45,
            ),
          ),
        ),
      ],
    );
  }
}
