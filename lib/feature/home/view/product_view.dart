import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/home/view/widgets/build_products_section.dart';
import 'package:commerce_hub/feature/home/view/widgets/row_text.dart';
import 'package:commerce_hub/feature/home/view/widgets/search_for_fruit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  String? _searchQuery;
  List<ProductInputEntity> _filteredProducts = [];
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();

    super.initState();
  }

  /// search for product methoud by hesham;
  void _searchProducts(String? query) {
    setState(() {
      // If query is empty, set _searchQuery to null to show all products
      if (query == null || query.isEmpty) {
        _searchQuery = null;
        _filteredProducts = [];
        return;
      }

      _searchQuery = query;
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
                      SearchForFruit(
                        onChanged: _searchProducts,
                      ),
                      verticalSpace(8),
                      RowTextandIcon(
                        productsLength:
                            context.read<ProductsCubit>().productsLength,
                      ),
                      verticalSpace(8),
                      // Show filtered products if there's a search query, otherwise show all products
                      buildProductsSection(
                          searchQuery: _searchQuery,
                          filteredProducts: _filteredProducts)
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
