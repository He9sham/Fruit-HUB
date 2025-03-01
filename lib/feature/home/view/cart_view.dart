import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/home/view/widgets/cart_header.dart';
import 'package:commerce_hub/feature/home/view/widgets/cart_view_list.dart';
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
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        verticalSpace(30),
                        const CustomAppbar(
                          isshowback: true,
                          text: 'السلة',
                          spacepadding: 130,
                          isshowIcon: false,
                        ),
                        verticalSpace(25),
                        CartHeader(),
                        verticalSpace(25),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                  ),
                  CartViewList(
                    cartItemEntities: [],
                  ),
                  SliverToBoxAdapter(
                    child: Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: MediaQuery.sizeOf(context).height * 0.1,
                child: AppTextButton(
                  buttonText: 'الدفع  120جنيه',
                  onPressed: () {},
                  textStyle: Styles.textbuttom16White,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
