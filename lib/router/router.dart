import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/features/presentation/favourites/favourites.dart';
import 'package:whisk_and_serve/features/presentation/home/home.dart';
import 'package:whisk_and_serve/features/presentation/profile/profile.dart';
import 'package:whisk_and_serve/features/widgets/base_scaffold.dart';
import 'package:whisk_and_serve/router/app_routes.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return BaseScaffold(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.home,
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
        GoRoute(
          path: AppRoutes.favourites,
          builder: (BuildContext context, GoRouterState state) {
            return const Favourites();
          },
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (BuildContext context, GoRouterState state) {
            return const Profile();
          },
        ),
      ],
    ),
  ],
);
