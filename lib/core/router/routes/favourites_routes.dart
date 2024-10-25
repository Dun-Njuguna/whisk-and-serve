import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/core/router/routes/app_routes.dart';
import 'package:whisk_and_serve/core/router/router.dart';
import 'package:whisk_and_serve_favourites/presentation/favourites.dart';

/// Defines the route for the favourites page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.favourites);
/// ```
final favouritesRoutes = GoRoute(
  path: AppRoutes.favourites,
  pageBuilder: (context, state) => buildPageWithTransition(
    const Favourites(),
    state,
  ),
);
