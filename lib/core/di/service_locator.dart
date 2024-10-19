import 'package:get_it/get_it.dart';
import 'package:whisk_and_serve/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve/data/repositories/recipe_repository_impl.dart';
import 'package:whisk_and_serve/domain/repositories/recipe_repository_interface.dart';
import 'package:whisk_and_serve/domain/use_cases/get_recipe_categories.dart';

final sl = GetIt.instance;

void setupLocator() {
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
}

// Function to register all data sources
void _registerDataSources() {
  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSource(),
  );
}

// Function to register all repositories
void _registerRepositories() {
  sl.registerLazySingleton<RecipeRepositoryInterface>(
    () => RecipeRepositoryImpl(remoteDataSource: sl()),
  );
}

// Function to register all use cases
void _registerUseCases() {
  sl.registerLazySingleton<GetRecipeCategories>(
    () => GetRecipeCategories(repository: sl()),
  );
}
