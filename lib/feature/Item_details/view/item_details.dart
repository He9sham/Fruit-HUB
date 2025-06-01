import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/about_item.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/custom_clippath.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/header_for_item_details.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/header_review.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/text_widget_for_description.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.productInputEntity});
  final ProductInputEntity productInputEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClipPath(
                image: productInputEntity.imageUrl!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    HeaderForItemDetails(
                        productInputEntity: productInputEntity),
                    verticalSpace(8),
                    HeaderReview(),
                    verticalSpace(10),
                    TextWidgetForDescription(),
                    verticalSpace(16),
                    Row(
                      children: [
                        AboutItem(
                          image: 'assets/image/image_svg/lotus.svg',
                          title: productInputEntity.isOrganic ? '100%' : '0%',
                          subTitle: productInputEntity.isOrganic
                              ? 'اورجانيك'
                              : 'غير اورجانيك',
                        ),
                        horizontalSpace(16),
                        AboutItem(
                          image: 'assets/image/image_svg/Group 36850.svg',
                          title: '${productInputEntity.expirationsMonths} عام',
                          subTitle: 'الصلاحيه',
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Row(
                      children: [
                        AboutItem(
                          image: 'assets/image/image_svg/Star.svg',
                          title: '4.8',
                          subTitle: 'Reviews',
                        ),
                        horizontalSpace(16),
                        AboutItem(
                          image: 'assets/image/image_svg/Group.svg',
                          title: productInputEntity.numberOfCalories.toString(),
                          subTitle: 'كالوري',
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: 'اضف الى السلة',
                      onPressed: () {
                        context
                            .read<CartProductCubit>()
                            .addProduct(productInputEntity);
                        showSnackBar(context, 'تم اضافة المنتج الى السلة');
                      },
                      textStyle: Styles.textbuttom16White,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
