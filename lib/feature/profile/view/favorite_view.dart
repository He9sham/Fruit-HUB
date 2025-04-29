import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/profile/view/widgets/favorite_item_bloc_builder.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  isshowback: true,
                  isshowIcon: false,
                  spacepadding: 125,
                  text: 'المفضلة',
                ),
                verticalSpace(28),
                FavoriteItemBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
