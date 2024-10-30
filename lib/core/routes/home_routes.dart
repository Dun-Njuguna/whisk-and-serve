import 'package:whisk_and_serve/core/routes/app_routes.dart';
import 'package:whisk_and_serve_core/router/app_route_config.dart';
import 'package:whisk_and_serve_core/router/router.dart';
import 'package:whisk_and_serve_explore/presentation/pages/explore.dart';

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
      // Add child routes if needed
    ],
  ),
);