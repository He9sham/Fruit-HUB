
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_gridview_for_homepage.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_cubit.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItemBlocBuilder extends StatelessWidget {
  const FavoriteItemBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          if (state.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: Colors.grey,
                  ),
                  verticalSpace(16),
                  Text(
                    'لا توجد منتجات في المفضلة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
          return CustomGridviewForHomePage(
            products: state.favorites,
          );
        } else if (state is FavoritesError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
