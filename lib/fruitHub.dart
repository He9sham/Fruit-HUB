import 'package:commerce_hub/core/theming/app_theme.dart';
import 'package:commerce_hub/core/theming/theme_provider.dart';
import 'package:commerce_hub/core/utils/app_route.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CommerceHub extends StatelessWidget {
  const CommerceHub({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.generateRoute,
          ),
        );
      }),
    );
  }
}
