import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/logic/check_loggedin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      if (isloggedIn()) {
        // ignore: use_build_context_synchronously
        context.pushNamed(Routes.navigationBar);
      } else {
        // ignore: use_build_context_synchronously
        context.pushNamed(Routes.loginScreen);
      }
    });
    super.initState();
  }

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
