import 'package:whisk_and_serve/features/explore/data/data_sources/local_data_source.dart';
import 'package:whisk_and_serve/features/explore/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve/features/explore/data/repositories/recipe_repository_impl.dart';
import 'package:whisk_and_serve/features/explore/domain/repositories/recipe_repository_interface.dart';
import 'package:whisk_and_serve/features/explore/domain/use_cases/get_recipe_categories.dart';
import 'package:whisk_and_serve_core/data/isar_helpers.dart';
import 'package:whisk_and_serve_core/di/service_locator.dart';

Future<void> setupLocator() async {
  final x = await registerIsar();
  print("object    $x");
  _registerDataSources(x);
  _registerRepositories();
  _registerUseCases();
}

// Register all data sources
void _registerDataSources(Type x) {
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
