import 'package:whisk_and_serve_core/api/network_client.dart';
import 'package:whisk_and_serve_core/data/isar_helpers.dart';
import 'package:whisk_and_serve_core/di/service_locator.dart';
import 'package:whisk_and_serve_explore/features/categories/data/data_sources/local_data_source.dart';
import 'package:whisk_and_serve_explore/features/categories/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve_explore/features/categories/data/repositories/recipe_repository_impl.dart';
import 'package:whisk_and_serve_explore/features/categories/domain/repositories/recipe_repository_interface.dart';
import 'package:whisk_and_serve_explore/features/categories/domain/use_cases/get_recipe_categories.dart';
import 'package:whisk_and_serve_explore/features/meals/data/repositories/meal_repository_impl.dart';
import 'package:whisk_and_serve_explore/features/meals/domain/repositories/meal_repository_interface.dart';
import 'package:whisk_and_serve_explore/features/meals/domain/usecases/get_meals_by_main_ingrident.dart';
import 'package:whisk_and_serve_explore/whisk_and_serve_explore.dart';

Future<void> setupLocator() async {
  await registerIsar();
  _registerDio();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
}

void _registerDio() {
  const baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  sl.registerLazySingleton(
    () => NetworkClient(
      baseUrl: baseUrl,
    ),
  );
}

// Register all data sources
void _registerDataSources() {
  sl.registerLazySingleton<IsarHelpers>(
    () => IsarHelpers(sl()),
  );
  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSource(client: sl()),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(sl()),
  );

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(client: sl()),
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
  sl.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
}

// Register all use cases
void _registerUseCases() {
  sl.registerLazySingleton<GetRecipeCategories>(
    () => GetRecipeCategories(repository: sl()),
  );
  sl.registerLazySingleton<GetMealsByMainIngrident>(
    () => GetMealsByMainIngrident(repository: sl()),
  );
}
