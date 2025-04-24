// Build the products section based on search state
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_gridview_for_homepage.dart';
import 'package:commerce_hub/feature/home/view/widgets/gridview_for_home_bloc_builder.dart';
import 'package:flutter/material.dart';

Widget buildProductsSection(
    {required String? searchQuery,
    required List<ProductInputEntity> filteredProducts}) {
  // Case 1: No search query - show all products
  if (searchQuery == null || searchQuery.isEmpty) {
    return GridViewForHomeViewBlocBuilder();
  }

  // Case 2: Search query with results - show filtered products
  if (filteredProducts.isNotEmpty) {
    return CustomGridviewForHomePage(products: filteredProducts);
  }

  // Case 3: Search query with no results - show "No matching results" message
  return Center(
    child: Text(
      'لا توجد نتائج مطابقة',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
  );
}
