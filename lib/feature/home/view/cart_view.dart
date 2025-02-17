import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/cart_header.dart';
import 'package:commerce_hub/feature/home/view/widgets/cart_item.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar.dart'
    show CustomAppbar;
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    verticalSpace(30),
                    const CustomAppbar(
                      text: 'السلة',
                      spacepadding: 130,
                      isshowIcon: false,
                    ),
                    verticalSpace(25),
                    CartHeader(),
                    verticalSpace(24),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                    CartItem(),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
