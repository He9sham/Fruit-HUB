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
        context.pushReplacementNamed(Routes.navigationBar);
      } else {
        // ignore: use_build_context_synchronously
        context.pushReplacementNamed(Routes.onBoardingScreen);
      }
    });
    super.initState();
  }

  Widget _buildSvgAsset(String assetPath, {double? height}) {
    return SizedBox(
      height: height ?? 200,
      child: SvgPicture.asset(
        assetPath,
        fit: BoxFit.contain,
        placeholderBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        semanticsLabel: 'SVG Image',
        colorFilter:
            const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSvgAsset(
              'assets/image/image_svg/freepik--Plant--inject-63.svg',
              height: 200,
            ),
            verticalSpace(90),
            Center(
              child: _buildSvgAsset(
                'assets/image/image_svg/LogoApp.svg',
                height: 100,
              ),
            ),
            verticalSpace(165),
            _buildSvgAsset(
              'assets/image/image_svg/freepik--Circles--inject-5.svg',
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
