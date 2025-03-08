import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          isselcted: selected == 0,
          ontap: () {
            setState(() {
              selected = 0;
            });
          },
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40 جنيه',
        ),
        verticalSpace(10),
        ShippingItem(
          isselcted: selected == 1,
          ontap: () {
            setState(() {
              selected = 1;
            });
          },
          title: 'اشتري الان وادفع لاحقا',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}
