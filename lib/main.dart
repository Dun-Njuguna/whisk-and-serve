import 'package:flutter/material.dart';
import 'package:whisk_and_serve/core/di/service_locator.dart';

import 'package:whisk_and_serve_core/router/nav/custom_nav_bar.dart';
import 'package:whisk_and_serve_core/theme/theme.dart';
import 'package:whisk_and_serve_core/whisk_and_serve_core.dart';

import 'package:whisk_and_serve/core/routes/favourites_routes.dart';
import 'package:whisk_and_serve/core/routes/home_routes.dart';
import 'package:whisk_and_serve/core/routes/profile_routes.dart';

import 'package:whisk_and_serve_explore/features/categories/presentation/bloc/recipe_categories_bloc.dart';
import 'package:whisk_and_serve_explore/features/meals/presentation/bloc/meals_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Initialise nav bar
  final navBar = CustomNavBar(navItems: navItems);

  final appRoutes = [
    exploreRoutes,
    favouritesRoutes,
    profileRoutes,
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bloc_providers.addAll([
      createBlocProvider<RecipeCategoriesBloc>(
        RecipeCategoriesBloc(getRecipeCategories: sl()),
      ),
      createBlocProvider<MealsBloc>(
        MealsBloc(getMealsByMainIngrident: sl()),
      ),
    ]);
    return createMultiBlocProvider(
      providers: bloc_providers,
      child: MaterialApp.router(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router(routes: appRoutes),
      ),
    );
  }
}
