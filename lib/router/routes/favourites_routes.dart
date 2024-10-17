import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/features/presentation/favourites/favourites.dart';
import 'package:whisk_and_serve/router/routes/app_routes.dart';
import 'package:whisk_and_serve/router/router.dart';

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
