import 'package:whisk_and_serve/core/routes/app_routes.dart';
import 'package:whisk_and_serve_core/router/app_route_config.dart';
import 'package:whisk_and_serve_core/router/router.dart';
import 'package:whisk_and_serve_favourites/presentation/favourites.dart';

/// Defines the route for the favourites page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.favourites);
/// ```
final favouritesRoutes = createGoRoute(
  AppRouteConfig(
    parentPath: AppRoutes.favourites,
    parentWidget: const Favourites(),
    childRoutes: [
      // Add child routes if needed
    ],
  ),
);
