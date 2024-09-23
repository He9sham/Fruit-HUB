import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/image/freepik--Plant--inject-63.svg'),
            verticalSpace(90),
            Center(
              child: SvgPicture.asset('assets/image/LogoApp.svg'),
            ),
            verticalSpace(165),
            SvgPicture.asset('assets/image/freepik--Circles--inject-5.svg'),
          ],
        ),
      ),
    );
  }
}
