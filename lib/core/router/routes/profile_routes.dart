import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/presentation/pages/profile/profile.dart';
import 'package:whisk_and_serve/core/router/routes/app_routes.dart';
import 'package:whisk_and_serve/core/router/router.dart';

/// Defines the route for the profile page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.profile);
/// ```
final profileRoutes = GoRoute(
  path: AppRoutes.profile,
  pageBuilder: (context, state) => buildPageWithTransition(
    const Profile(),
    state,
  ),
);
