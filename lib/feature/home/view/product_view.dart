import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/home/view/widgets/search_for_fruit.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              verticalSpace(20),
              CustomAppbar(),
              verticalSpace(25),
              SearchForFruit(),
            ],
          ),
        ),
      ),
    );
  }
}
