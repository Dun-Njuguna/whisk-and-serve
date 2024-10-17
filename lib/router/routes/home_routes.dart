import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/features/presentation/home/home.dart';
import 'package:whisk_and_serve/router/routes/app_routes.dart';
import 'package:whisk_and_serve/router/router.dart';

/// Defines the route for the home page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.home);
/// ```
final homeRoutes = GoRoute(
  path: AppRoutes.home,
  pageBuilder: (context, state) => buildPageWithTransition(
    const Home(),
    state,
  ),
  routes: const []
);
