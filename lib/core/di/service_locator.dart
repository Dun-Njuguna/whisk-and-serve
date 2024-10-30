import 'package:whisk_and_serve_core/data/isar_helpers.dart';
import 'package:whisk_and_serve_core/di/service_locator.dart';
import 'package:whisk_and_serve_explore/data/data_sources/local_data_source.dart';
import 'package:whisk_and_serve_explore/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve_explore/data/repositories/recipe_repository_impl.dart';
import 'package:whisk_and_serve_explore/domain/repositories/recipe_repository_interface.dart';
import 'package:whisk_and_serve_explore/domain/use_cases/get_recipe_categories.dart';

Future<void> setupLocator() async {
  await registerIsar();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
}

// Register all data sources
void _registerDataSources() {
  sl.registerLazySingleton<IsarHelpers>(
    () => IsarHelpers(sl()),
  );
  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSource(),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(sl()),
  );
}

// Register all repositories
void _registerRepositories() {
  sl.registerLazySingleton<RecipeRepositoryInterface>(
    () => RecipeRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
}

// Register all use cases
void _registerUseCases() {
  sl.registerLazySingleton<GetRecipeCategories>(
    () => GetRecipeCategories(repository: sl()),
  );
}
