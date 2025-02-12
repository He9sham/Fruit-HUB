import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/login_cubit/login_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/reset_password/cubit/resetpassword_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/login_view.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/resetpassword_view.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/onboarding_view.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/splash_view.dart';
import 'package:commerce_hub/feature/home/view/home_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/navigation_bar.dart';
import 'package:commerce_hub/feature/sign_up/logic/signup_cubit_cubit.dart';
import 'package:commerce_hub/feature/sign_up/view/sign_up_view.dart';
import 'package:commerce_hub/feature/test.dart';
import 'package:commerce_hub/feature/testview3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(),
            child: const SignUpView(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginView(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetpasswordCubit(),
            child: const ResetpasswordView(),
          ),
        );
      case Routes.navigationBar:
        return MaterialPageRoute(
          builder: (_) => CustomNavigation(),
        );
      case Routes.textview:
        return MaterialPageRoute(
          builder: (_) => Testview(),
        );
      case Routes.textview3:
        return MaterialPageRoute(
          builder: (_) => Testview3(),
        );
      default:
        return null;
    }
  }
}
