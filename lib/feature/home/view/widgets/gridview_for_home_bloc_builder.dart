import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/helper/get_dummy_product.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_gridview_for_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridViewForHomeViewBlocBuilder extends StatelessWidget {
  const GridViewForHomeViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return CustomGridviewForHomePage(
            products: state.products,
          );
        } else if (state is ProductsFaulier) {
          return Text(state.errmessage);
        } else {
          return Skeletonizer(
            child: CustomGridviewForHomePage(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
