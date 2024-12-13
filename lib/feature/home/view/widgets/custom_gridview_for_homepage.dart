
import 'package:commerce_hub/feature/home/view/widgets/custom_view_best_seller.dart';
import 'package:flutter/material.dart';

class CustomGridviewForHomePage extends StatelessWidget {
  const CustomGridviewForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: const CustomViewBestSeller(),
          );
        },
      ),
    );
  }
}
