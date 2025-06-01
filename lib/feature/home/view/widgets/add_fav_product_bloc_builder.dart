import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_view_best_seller.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_cubit.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddfavProducteBlocBuilder extends StatelessWidget {
  const AddfavProducteBlocBuilder({
    super.key,
    required this.widget,
  });

  final CustomViewBestSeller widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        // Check if product is in favorites
        final isInFavorites = state is FavoritesLoaded &&
            state.favorites.any((product) =>
                product.code == widget.productInputEntity.code);
    
        return IconButton(
          onPressed: () {
            context
                .read<FavoritesCubit>()
                .toggleFavorite(widget.productInputEntity);
            showSnackBar(
              context,
              isInFavorites
                  ? 'تمت ازالة من المفضلة'
                  : 'تمت اضافته الى المفضلة',
            );
          },
          icon: Icon(
            isInFavorites
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart,
            color: isInFavorites ? Colors.red : Colors.black,
          ),
        );
      },
    );
  }
}
