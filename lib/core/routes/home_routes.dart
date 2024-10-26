import 'package:whisk_and_serve/features/explore/presentation/pages/explore.dart';
import 'package:whisk_and_serve/core/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/features/explore/presentation/bloc/recipe_categories_bloc.dart';
import 'package:whisk_and_serve_core/di/service_locator.dart';
import 'package:whisk_and_serve_core/router/app_route_config.dart';
import 'package:whisk_and_serve_core/router/router.dart';

/// Defines the route for the home page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.explore);
/// ```
final exploreRoutes = createGoRoute(
  AppRouteConfig(
    parentPath: AppRoutes.explore,
    parentWidget: BlocProvider(
      create: (context) => RecipeCategoriesBloc(
        getRecipeCategories: sl(),
      )..add(FetchRecipeCategories()),
      child: const Explore(),
    ),
    childRoutes: [
      // Add child routes if needed
    ],
  ),
);
