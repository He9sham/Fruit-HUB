import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_cubit.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomViewBestSeller extends StatefulWidget {
  const CustomViewBestSeller({
    super.key,
    required this.productInputEntity,
  });

  final ProductInputEntity productInputEntity;
  @override
  State<CustomViewBestSeller> createState() => _CustomViewBestSellerState();
}

class _CustomViewBestSellerState extends State<CustomViewBestSeller> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.itemDetails,
          arguments: widget.productInputEntity,
        );
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.3,
        width: MediaQuery.sizeOf(context).width * 0.5,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Stack(
          textDirection: TextDirection.rtl,
          children: [
            Positioned(
              top: 8.h,
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
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
              ),
            ),
            Positioned(
              top: 15.h,
              right: 25.w,
              child: widget.productInputEntity.imageUrl != null
                  ? Image.network(
                      widget.productInputEntity.imageUrl!,
                      width: 150.w,
                      height: 130.h,
                    )
                  : SizedBox(
                      width: 100.w,
                      height: 100.h,
                    ),
            ),
            Positioned(
              top: 175.h,
              right: 105.w,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: IconButton(
                  onPressed: () {
                    context
                        .read<CartProductCubit>()
                        .addProduct(widget.productInputEntity);
                  },
                  icon: Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 175.h,
              right: 19.w,
              child: Text(
                widget.productInputEntity.name,
                style: Styles.textSize13Black600,
              ),
            ),
            Positioned(
              top: 195.h,
              right: 19.w,
              child: Text(
                widget.productInputEntity.price.toString(),
                style: Styles.textSize13Black600.copyWith(
                    color: Colors.yellow.shade800, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
