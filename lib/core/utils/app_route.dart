import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub/core/service/get_it_service.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/navigation_bar.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/login_cubit/login_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/reset_password/cubit/resetpassword_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/login_view.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/resetpassword_view.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/onboarding_view.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/splash_view.dart';
import 'package:commerce_hub/feature/checkout/logic/add_order_cubit/add_order_cubit.dart';
import 'package:commerce_hub/feature/checkout/view/checkout_view.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:commerce_hub/feature/home/view/best_seller_view.dart';
import 'package:commerce_hub/feature/home/view/home_view.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_cubit.dart';
import 'package:commerce_hub/feature/profile/view/favorite_view.dart';
import 'package:commerce_hub/feature/sign_up/logic/signup_cubit.dart';
import 'package:commerce_hub/feature/sign_up/view/sign_up_view.dart';
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
      case Routes.bestsellerview:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductsCubit(
                  getIt.get<ProductRepo>(),
                ),
              ),
              BlocProvider(
                create: (context) => CartProductCubit(),
              ),
              BlocProvider.value(
                value: getIt<FavoritesCubit>(),
              ),
            ],
            child: BestSellerView(),
          ),
        );
      case Routes.checkout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddOrderCubit(
              getIt.get<OrderRepo>(),
            ),
            child: CheckoutView(
              cartEntity: arguments as CartEntity,
            ),
          ),
        );
      case Routes.favorite:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<FavoritesCubit>(),
            child: const FavoriteView(),
          ),
        );
      default:
        return null;
    }
  }
}
