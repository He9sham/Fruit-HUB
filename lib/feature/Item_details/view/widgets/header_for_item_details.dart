
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/feature/Item_details/view/widgets/buttom_action_quanttiy.dart';
import 'package:flutter/material.dart';

class HeaderForItemDetails extends StatelessWidget {
  const HeaderForItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "بطيخ",
                style: Styles.textRowNavigate16gray.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtomActionTest(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                '20 جنية / الكيلو',
                style: Styles.textSize13gree600.copyWith(
                  color: Color(0xffF4A91F),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
