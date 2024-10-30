import 'package:flutter/material.dart';
import 'package:whisk_and_serve/core/di/service_locator.dart';
import 'package:whisk_and_serve/core/routes/app_routes.dart';
import 'package:whisk_and_serve_core/bloc/bloc_helpers.dart';

import 'package:whisk_and_serve_core/di/service_locator.dart';
import 'package:whisk_and_serve_core/router/nav/custom_nav_bar.dart';
import 'package:whisk_and_serve_core/router/router.dart';
import 'package:whisk_and_serve_core/theme/theme.dart';
import 'package:whisk_and_serve_explore/presentation/bloc/recipe_categories_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Initialise nav bar
  final navBar = CustomNavBar(navItems: navItems);
  final providers = [
    createBlocProvider<RecipeCategoriesBloc>(
      RecipeCategoriesBloc(
        getRecipeCategories: sl(),
      ),
    ),
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return createMultiBlocProvider(
      providers: providers,
      child: MaterialApp.router(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router(routes: appRoutes),
      ),
    );
  }
}
