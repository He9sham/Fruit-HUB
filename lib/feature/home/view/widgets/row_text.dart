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
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Color(0xff949D9E),
          ),
        )
      ],
    );
  }
}
