import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter newRouter = GoRouter(
  navigatorKey: Get.navigatorKey,
  initialLocation: RouterUtils.root,
  errorBuilder: RouteConfigs.errorBuilder,
  redirect: RouteConfigs.redirect, // handle auth check di sini
  routes: <RouteBase>[
    GoRoute(
      path: RouterUtils.root,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: RouterUtils.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: RouterUtils.materi,
      builder: (BuildContext context, GoRouterState state) {
        final EnumPageState pageState = state.extra as EnumPageState? ?? EnumPageState.ayoBelajar;

        return MateriView(
          pageState: pageState,
        );
      },
    ),
  ],
);
