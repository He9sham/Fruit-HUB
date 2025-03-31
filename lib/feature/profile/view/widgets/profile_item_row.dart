import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/feature/profile/view/widgets/switch_icon.dart';
import 'package:flutter/material.dart';

class ProfileItemRow extends StatelessWidget {
  const ProfileItemRow({
    super.key,
    required this.title,
    required this.icon,
    required this.isShowBack,
    required this.isShowSwitch,
    this.switchType = SwitchType.other,
  });

  final String title;
  final IconData icon;
  final bool isShowBack;
  final bool isShowSwitch;
  final SwitchType switchType;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(icon),
        horizontalSpace(8),
        Text(
          title,
          style: Styles.textSize13Black600.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        Spacer(),
        Visibility(
          visible: isShowBack,
          child: Icon(Icons.arrow_back_ios),
        ),
        Visibility(
          visible: isShowSwitch,
          child: SwitchWidget(switchType: switchType),
        )
      ],
    );
  }
}
