import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/presentation/widgets/base_scaffold.dart';
import 'package:whisk_and_serve/core/router/routes/favourites_routes.dart';
import 'package:whisk_and_serve/core/router/routes/home_routes.dart';
import 'package:whisk_and_serve/core/router/routes/profile_routes.dart';

/// The main [GoRouter] instance responsible for handling navigation throughout the app.
/// It uses a [ShellRoute] to provide a common base layout (e.g., [BaseScaffold])
/// for all screens while preserving the bottom navigation bar.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return BaseScaffold(child: child);
      },
      routes: <RouteBase>[
        exploreRoutes,
        favouritesRoutes,
        profileRoutes,
      ],
    ),
  ],
);

/// A helper function that wraps the widget with a custom transition when navigating between screens.
///
/// [child] - The widget representing the new page.
/// [state] - The current state of the [GoRouter], used to retrieve the unique [pageKey].
///
/// The function uses a [FadeTransition] to smoothly transition between pages, with adjustable
/// [transitionDuration] and [reverseTransitionDuration].
CustomTransitionPage buildPageWithTransition(
    Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  );
}
