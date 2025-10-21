import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/config/router/app_router.dart';
import 'package:tafeel_task/config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final bool isMobile =
        (orientation == Orientation.portrait && width < 600) ||
        (orientation == Orientation.landscape && height < 600);
    return ScreenUtilInit(
      designSize: isMobile ? const Size(390, 845) : const Size(600, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final appRouter = AppRouter();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
