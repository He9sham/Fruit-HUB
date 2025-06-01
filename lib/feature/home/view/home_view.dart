import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/service/analytics_service.dart';
import 'package:commerce_hub/core/service/get_it_service.dart';
import 'package:commerce_hub/feature/home/view/widgets/best_seller_text.dart';
import 'package:commerce_hub/feature/home/view/widgets/build_products_section.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar_home_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/offers_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/search_for_fruit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Reference to the analytics service
  final AnalyticsService _analyticsService = getIt<AnalyticsService>();
  
  String? _searchQuery;
  List<ProductInputEntity> _filteredProducts = [];

  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingroducts();
    super.initState();
  }

  void _searchProducts(String? query) {
    setState(() {
      if (query == null || query.isEmpty) {
        _searchQuery = null;
        _filteredProducts = [];
        return;
      }

      _searchQuery = query;
      _analyticsService.trackSearch(query);
      
      final state = context.read<ProductsCubit>().state;
      if (state is ProductsSuccess) {
        _filteredProducts = state.products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
                      SearchForFruit(
                        onChanged: _searchProducts,
                      ),
                      verticalSpace(12),
                      const OffersView(),
                      verticalSpace(8),
                      const BestSellerText(),
                      verticalSpace(8),
                      buildProductsSection(
                        searchQuery: _searchQuery,
                        filteredProducts: _filteredProducts,
                      ),
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