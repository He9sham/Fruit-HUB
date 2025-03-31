import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/profile/view/widgets/profile_item_row.dart';
import 'package:commerce_hub/feature/profile/view/widgets/switch_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItemRow(
          isShowBack: true,
          isShowSwitch: false,
          icon: FontAwesomeIcons.user,
          title: 'الملف الشخصي',
        ),
        verticalSpace(8),
        Divider(
          thickness: 1,
          endIndent: 1,
          color: Color(0xffE5E5E5),
        ),
        verticalSpace(12),
        ProfileItemRow(
          isShowBack: true,
          isShowSwitch: false,
          icon: FontAwesomeIcons.box,
          title: 'الطلبات',
        ),
        verticalSpace(8),
        Divider(
          thickness: 1,
          endIndent: 1,
          color: Color(0xffE5E5E5),
        ),
        verticalSpace(12),
        ProfileItemRow(
          isShowBack: true,
          isShowSwitch: false,
          icon: FontAwesomeIcons.wallet,
          title: 'المدفوعات',
        ),
        verticalSpace(8),
        Divider(
          thickness: 1,
          endIndent: 1,
          color: Color(0xffE5E5E5),
        ),
        verticalSpace(12),
        ProfileItemRow(
          isShowBack: true,
          isShowSwitch: false,
          icon: FontAwesomeIcons.heart,
          title: 'المفضلة',
        ),
        verticalSpace(8),
        Divider(
          thickness: 1,
          endIndent: 1,
          color: Color(0xffE5E5E5),
        ),
        ProfileItemRow(
          isShowBack: false,
          isShowSwitch: true,
          icon: FontAwesomeIcons.bell,
          title: 'الاشعارات',
          switchType: SwitchType.notification,
        ),
        Divider(
          thickness: 1,
          endIndent: 1,
          color: Color(0xffE5E5E5),
        ),
        ProfileItemRow(
          title: 'الوضع',
          icon: FontAwesomeIcons.wandMagicSparkles,
          isShowBack: false,
          isShowSwitch: true,
          switchType: SwitchType.theme,
        ),
        Divider(
          thickness: 1,
          endIndent: 1,
          color: Color(0xffE5E5E5),
        ),
      ],
    );
  }
}
