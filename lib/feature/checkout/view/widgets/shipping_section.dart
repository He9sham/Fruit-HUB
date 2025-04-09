import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              context.read<OrderInputEntity>().payWithcach = true;
            });
          },
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              '${(context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 30).toString()} جنيه',
        ),
        verticalSpace(10),
        ShippingItem(
          isselcted: selected == 1,
          ontap: () {
            setState(() {
              selected = 1;
              context.read<OrderInputEntity>().payWithcach = false;
            });
          },
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price:
              '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice().toString()} جنيه',
        ),
      ],
    );
  }
}
