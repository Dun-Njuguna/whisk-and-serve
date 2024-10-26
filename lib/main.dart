import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/core/di/service_locator.dart';
import 'package:whisk_and_serve/core/routes/app_routes.dart';

import 'package:whisk_and_serve/features/explore/presentation/bloc/recipe_categories_bloc.dart';
import 'package:whisk_and_serve_core/di/service_locator.dart';
import 'package:whisk_and_serve_core/router/router.dart';
import 'package:whisk_and_serve_core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getBlocProviders(),
      child: MaterialApp.router(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router(routes: appRoutes),
      ),
    );
  }

  // Returning list of BLoC providers
  List<BlocProvider> _getBlocProviders() {
    return [
      BlocProvider(
        create: (context) => RecipeCategoriesBloc(
          getRecipeCategories: sl(),
        ),
      ),
    ];
  }
}
