import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/best_seller_text.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar_home_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/gridview_for_home_bloc_builder.dart';
import 'package:commerce_hub/feature/home/view/widgets/offers_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/search_for_fruit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingroducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<ProductsCubit>().getBestSellingroducts();
              await Future.delayed(const Duration(seconds: 4));
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
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
                      GridViewForHomeViewBlocBuilder(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
