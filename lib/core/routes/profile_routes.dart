import 'package:whisk_and_serve/features/profile/presentation/profile.dart';
import 'package:whisk_and_serve_core/router/app_route_config.dart';
import 'package:whisk_and_serve_core/router/app_routes.dart';
import 'package:whisk_and_serve_core/router/router.dart';

/// Defines the route for the profile page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.profile);
/// ```
final profileRoutes = createGoRoute(
  AppRouteConfig(
    parentPath: AppRoutes.settings,
    parentWidget: const Profile(),
    childRoutes: [
      // Add child routes if needed
    ],
  ),
);
