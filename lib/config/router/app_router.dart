import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tafeel_task/app/injector.dart';
import 'package:tafeel_task/config/router/routes.dart';
import 'package:tafeel_task/features/home/cubit/home_cubit.dart';
import 'package:tafeel_task/features/home/presentation/screens/home_screen.dart';
import 'package:tafeel_task/features/user_details/cubit/user_details_cubit.dart';
import 'package:tafeel_task/features/user_details/presentation/screens/user_details_screen.dart';

class AppRouter {
  static AppRouter? _instance;
  AppRouter._internal();
  factory AppRouter() {
    _instance ??= AppRouter._internal();
    return _instance!;
  }

  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(
    debugLabel: 'root',
  );

  static final GlobalKey<NavigatorState> sectionANavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

  final router = GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => di<HomeCubit>(),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: Routes.userDetails,
        name: Routes.userDetails,
        builder: (context, state) {
          final id = (state.extra ?? '') as String;
          return BlocProvider(
            create: (context) => di<UserDetailsCubit>(),
            child: UserDetailsScreen(id: id),
          );
        },
      ),
    ],
  );
}
