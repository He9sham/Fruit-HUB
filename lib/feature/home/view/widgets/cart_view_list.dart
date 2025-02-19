import 'package:commerce_hub/feature/home/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartViewList extends StatelessWidget {
  const CartViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return CartItem();
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.shade200,
          thickness: 1,
        );
      },
      itemCount: 10,
    );
  }
}
