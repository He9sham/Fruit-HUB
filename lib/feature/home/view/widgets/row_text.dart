import 'dart:ui';

import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/widgets/app_text_buttom.dart';
import 'package:commerce_hub/feature/home/view/widgets/row_text_chosse.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class RowTextandIcon extends StatelessWidget {
  const RowTextandIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Text(
          'نتائج',
          style: Styles.textbuttom16White.copyWith(color: Colors.black),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            showDargSheet(context);
          },
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Color(0xff949D9E),
          ),
        ),
      ],
    );
  }

  void showDargSheet(BuildContext context) {
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      child: Container(
        color: Colors.black.withValues(alpha: 0.4),
      ),
    );
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.60,
          minChildSize: 0.3,
          maxChildSize: 0.6,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(15),
                  Divider(
                    thickness: 3,
                    indent: 150,
                    endIndent: 150,
                    color: Colors.black,
                  ),
                  verticalSpace(25),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            '       : ترتيب حسب',
                            style: Styles.textappBar.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          verticalSpace(15),
                          RowTextChosse(
                            text: 'السعر ( الأقل الي الأعلي )',
                          ),
                          verticalSpace(10),
                          RowTextChosse(
                            text: 'السعر ( الأعلي الي الأقل )',
                          ),
                          verticalSpace(10),
                          RowTextChosse(
                            text: 'الأبجديه',
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(11),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppTextButton(
                      buttonText: 'تصفيه',
                      onPressed: () {},
                      textStyle: Styles.textbuttom16White,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
