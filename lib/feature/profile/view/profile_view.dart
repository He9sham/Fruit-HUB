import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/feature/home/view/widgets/custom_appbar.dart';
import 'package:commerce_hub/feature/profile/view/widgets/title_user_header.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
