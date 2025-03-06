import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/home/view/widgets/gridview_for_home_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingroducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
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
                      const CustomAppbar(
                        isshowback: true,
                        text: 'الأكثر مبيعًا',
                        spacepadding: 70,
                        isshowIcon: true,
                      ),
                      verticalSpace(24),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            'الأكثر مبيعًا',
                            style: Styles.textbuttom16White
                                .copyWith(color: Colors.black),
                          ),
                        ],
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
