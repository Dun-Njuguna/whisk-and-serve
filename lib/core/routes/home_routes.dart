import 'package:whisk_and_serve_core/router/app_route_config.dart';
import 'package:whisk_and_serve_core/router/app_routes.dart';
import 'package:whisk_and_serve_core/router/router.dart';
import 'package:whisk_and_serve_explore/features/categories/presentation/pages/categories.dart';
import 'package:whisk_and_serve_explore/features/meals/presentation/pages/meals.dart';

/// Defines the route for the home page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.explore);
/// ```
final exploreRoutes = createGoRoute(
  AppRouteConfig(
    parentPath: AppRoutes.explore,
    parentWidget: const Explore(),
    childRoutes: [
      ChildRouteConfig(
        path: AppRoutes.meals,
        childWidget: const Meals(),
      )
    ],
  ),
);
