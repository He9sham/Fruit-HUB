import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_view_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridviewForHomePage extends StatelessWidget {
  const CustomGridviewForHomePage({super.key, required this.products});
  final List<ProductInputEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3,
      child: GridView.builder(
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 0.3.sh,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            child: const CustomViewBestSeller(),
          );
        },
      ),
    );
  }
}
