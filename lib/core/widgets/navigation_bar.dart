import 'package:commerce_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce_hub/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub/core/service/get_it_service.dart';
import 'package:commerce_hub/core/theming/gradient_color.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:commerce_hub/feature/home/logic/cart_item_cubit/cartitem_cubit.dart';
import 'package:commerce_hub/feature/home/view/cart_view.dart';
import 'package:commerce_hub/feature/home/view/home_view.dart';
import 'package:commerce_hub/feature/home/view/product_view.dart';
import 'package:commerce_hub/feature/home/view/widgets/main_view_bloc_consumer.dart'
    show MainViewBlocConsumer;
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_cubit.dart';
import 'package:commerce_hub/feature/profile/view/profile_view.dart';
import 'package:cuberto_bottom_bar/internal/cuberto_bottom_bar.dart';
import 'package:cuberto_bottom_bar/internal/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int currentIndex = 0;
  final screens = [
    BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepo>(),
      ),
      child: HomeView(),
    ),
    BlocProvider(
      create: (context) => CartitemCubit(),
      child: CartView(),
    ),
    BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepo>(),
      ),
      child: ProductView(),
    ),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CartProductCubit(),
          ),
          BlocProvider(
            create: (context) => getIt<FavoritesCubit>(),
          ),
        ],
        child:
            MainViewBlocConsumer(currentIndex: currentIndex, screens: screens),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorShape: const CircleBorder(),
          indicatorColor: Colors.blue.shade100,
        ),
        child: CubertoBottomBar(
          textColor: Colors.green,
          barBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          inactiveIconColor: Colors.grey.withValues(alpha: 0.6),
          tabStyle: CubertoTabStyle.styleNormal,
          selectedTab: currentIndex,
          tabs: [
            TabData(
              iconData: FontAwesomeIcons.house,
              title: "الرئيسية",
              tabColor: Colors.deepPurple,
              tabGradient: getGradient(Colors.deepPurple),
            ),
            TabData(
              iconData: FontAwesomeIcons.basketShopping,
              title: "سلة التسوق",
              tabColor: Colors.pink,
              tabGradient: getGradient(Colors.red),
            ),
            TabData(
              iconData: FontAwesomeIcons.elementor,
              title: "المنتجات",
              tabColor: Colors.amber,
              tabGradient: getGradient(Colors.amber),
            ),
            TabData(
              iconData: FontAwesomeIcons.user,
              title: "حسابي",
              tabColor: Colors.teal,
              tabGradient: getGradient(Colors.teal),
            ),
          ]
              .map((value) => TabData(
                    key: Key(value.title),
                    iconData: value.iconData,
                    title: value.title,
                    tabColor: value.tabColor,
                    tabGradient: null,
                  ))
              .toList(),
          onTabChangedListener: (position, title, color) {
            setState(() {
              currentIndex = position;
            });
          },
        ),
      ),
    );
  }
}
