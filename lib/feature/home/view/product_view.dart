import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/home/view/widgets/gridview_for_home_bloc_builder.dart';
import 'package:commerce_hub/feature/home/view/widgets/row_text.dart';
import 'package:commerce_hub/feature/home/view/widgets/search_for_fruit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();

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
              context.read<ProductsCubit>().getProducts();
              await Future.delayed(const Duration(seconds: 4));
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      verticalSpace(16),
                      const CustomAppbar(
                        isshowback: false,
                        text: 'المنتجات',
                        spacepadding: 70,
                        isshowIcon: true,
                      ),
                      verticalSpace(25),
                      const SearchForFruit(),
                      verticalSpace(8),
                      RowTextandIcon(
                        productsLength:
                            context.read<ProductsCubit>().productsLength,
                      ),
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
