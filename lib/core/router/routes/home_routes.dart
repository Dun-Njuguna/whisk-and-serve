import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve/presentation/pages/explore/explore.dart';
import 'package:whisk_and_serve/core/router/routes/app_routes.dart';
import 'package:whisk_and_serve/core/router/router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/presentation/blocs/bloc/recipe_categories_bloc.dart';
import 'package:whisk_and_serve/core/di/service_locator.dart';

/// Defines the route for the home page in the app.
///
/// Example usage:
/// ```dart
/// context.go(AppRoutes.explore);
/// ```
final exploreRoutes = GoRoute(
  path: AppRoutes.explore,
  pageBuilder: (context, state) => buildPageWithTransition(
    BlocProvider(
      create: (context) => RecipeCategoriesBloc(
        getRecipeCategories: sl(),
      )..add(FetchRecipeCategories()),
      child: const Explore(),
    ),
    state,
  ),
  routes: const [],
);
