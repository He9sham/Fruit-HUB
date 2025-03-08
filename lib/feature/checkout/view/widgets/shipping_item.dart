import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.isselcted,
      required this.title,
      required this.subtitle,
      required this.price, required this.ontap});
  final String title, subtitle, price;
  final bool isselcted;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: ontap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 13,
            right: 28,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(
              side: isselcted
                  ? BorderSide(
                      color: Colors.black.withValues(alpha: 0.3),
                      width: 1,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black.withValues(alpha: 0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    color: isselcted ? Colors.green : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),
              horizontalSpace(10),
              Column(
                children: [
                  Text(
                    title,
                    style: Styles.textSize13Black600,
                  ),
                  verticalSpace(6),
                  Text(
                    subtitle,
                    style: Styles.textSize13Black600.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  textDirection: TextDirection.rtl,
                  price,
                  style: Styles.textSize13gree600.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
