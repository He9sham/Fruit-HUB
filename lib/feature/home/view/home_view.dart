import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/best_seller_text.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar_home_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_gridview_for_homepage.dart';
import 'package:commerce_hub/feature/home/view/widgets/offers_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/search_for_fruit.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(16),
              const CustomAppbarHomeview(),
              verticalSpace(25),
              const SearchForFruit(),
              verticalSpace(12),
              const OffersView(),
              verticalSpace(8),
              const BestSellerText(),
              verticalSpace(8),
              CustomGridviewForHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
