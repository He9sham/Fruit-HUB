import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/onboarding_view.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      default:
        return null;
    }
  }
}
