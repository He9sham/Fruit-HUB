import 'package:commerce_hub/feature/home/view/widgets/custom_view_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridviewForHomePage extends StatelessWidget {
  const CustomGridviewForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height.h,
      child: GridView.builder(
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
