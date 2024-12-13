import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/service/get_user.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbarHomeview extends StatelessWidget {
  const CustomAppbarHomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Image.asset('assets/image/Mask group.png'),
        horizontalSpace(11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '..!صباح الخير',
              style: Styles.textRowNavigate16gray,
            ),
            Text(
              getuser().name,
              style: Styles.textSize13Black600
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ],
        ),
        horizontalSpace(155),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.withValues(alpha: 0.4),
          ),
          child: const Icon(FontAwesomeIcons.bell),
        )
      ],
    );
  }
}
