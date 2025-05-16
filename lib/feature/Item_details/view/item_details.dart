import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/about_item.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/custom_clippath.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/header_for_item_details.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/header_review.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/text_widget_for_description.dart';
import 'package:flutter/material.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClipPath(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    HeaderForItemDetails(),
                    verticalSpace(8),
                    HeaderReview(),
                    verticalSpace(10),
                    TextWidgetForDescription(),
                    verticalSpace(16),
                    Row(
                      children: [
                        AboutItem(
                          image: 'assets/image/image_svg/lotus.svg',
                          title: '100%',
                          subTitle: 'اوجانيك',
                        ),
                        horizontalSpace(16),
                        AboutItem(
                          image: 'assets/image/image_svg/Group 36850.svg',
                          title: 'عام',
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
                          title: '80 كالوري',
                          subTitle: '100 جرام',
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: 'اضف الى السلة',
                      onPressed: () {},
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
