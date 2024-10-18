import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/core/theme/theme.dart';
import 'package:whisk_and_serve/core/router/router.dart';
import 'package:whisk_and_serve/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve/data/repositories/recipe_repository_impl.dart';
import 'package:whisk_and_serve/domain/use_cases/get_recipe_categories.dart';
import 'package:whisk_and_serve/presentation/blocs/bloc/recipe_categories_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => RecipeCategoriesBloc(
        getRecipeCategories: GetRecipeCategories(
          repository: RecipeRepositoryImpl(
            remoteDataSource: RecipeRemoteDataSource(),
          ),
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
