import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/features/presentation/profile/profile.dart';
import 'package:whisk_and_serve/router/routes/app_routes.dart';
import 'package:whisk_and_serve/router/router.dart';

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
