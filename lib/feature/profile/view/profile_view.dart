import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/core/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/profile/view/widgets/profile_item.dart';
import 'package:commerce_hub/feature/profile/view/widgets/profile_item_row.dart';
import 'package:commerce_hub/feature/profile/view/widgets/sign_out_container.dart';
import 'package:commerce_hub/feature/profile/view/widgets/title_user_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                verticalSpace(25),
                const CustomAppbar(
                  isshowback: false,
                  text: 'حسابي',
                  spacepadding: 130,
                  isshowIcon: false,
                ),
                verticalSpace(16),
                TitleUserHeader(),
                verticalSpace(30),
                Text(
                  'عام',
                  style: Styles.textSize13Black600,
                ),
                verticalSpace(16),
                ProfileItem(),
                verticalSpace(30),
                Text(
                  'المساعده',
                  style: Styles.textSize13Black600,
                ),
                verticalSpace(16),
                ProfileItemRow(
                  title: 'من نحن',
                  icon: FontAwesomeIcons.circleInfo,
                  isShowBack: true,
                  isShowSwitch: false,
                ),
                verticalSpace(70),
                SignOutContainer(),
                verticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
