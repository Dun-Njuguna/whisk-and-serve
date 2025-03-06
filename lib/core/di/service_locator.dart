import 'package:whisk_and_serve_core/api/network_client.dart';
import 'package:whisk_and_serve_core/data/isar_helpers.dart';
import 'package:whisk_and_serve_core/di/service_locator.dart';
import 'package:whisk_and_serve_explore/features/categories/domain/use_cases/get_recipe_categories.dart';
import 'package:whisk_and_serve_explore/features/meal_details/domain/usecases/get_meal_details_by_id.dart';
import 'package:whisk_and_serve_explore/features/meals/domain/usecases/get_meals_by_main_ingrident.dart';
import 'package:whisk_and_serve_explore/whisk_and_serve_explore.dart';
import 'package:whisk_and_serve_favourites/favourites/domain/usecases/add_to_favourites.dart';
import 'package:whisk_and_serve_favourites/favourites/domain/usecases/get_favourites.dart';
import 'package:whisk_and_serve_favourites/favourites/domain/usecases/is_favourite.dart';
import 'package:whisk_and_serve_favourites/favourites/domain/usecases/remove_from_favourites.dart';
import 'package:whisk_and_serve_favourites/whisk_and_serve_favourites.dart';

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

  sl.registerLazySingleton<MealDetailsRemoteDataSource>(
    () => MealDetailsRemoteDataSource(client: sl()),
  );

  sl.registerLazySingleton<FavouritesLocalDataSource>(
    () => FavouritesLocalDataSourceImpl(client: sl()),
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
  sl.registerLazySingleton<MealDetailsRepositoryInterface>(
    () => MealDetailsRepositoryImplementation(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<FavouritesRepositoryInterface>(
    () => FavouritesRepositoryImpl(
      localDataSource: sl(),
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
  sl.registerLazySingleton<GetMealDetailsById>(
    () => GetMealDetailsById(repository: sl()),
  );

  // Favourites Use cases
  sl.registerLazySingleton<AddToFavourites>(
    () => AddToFavourites(repository: sl()),
  );

  sl.registerLazySingleton<GetFavourites>(
    () => GetFavourites(repository: sl()),
  );

  sl.registerLazySingleton<IsFavourite>(
    () => IsFavourite(repository: sl()),
  );

  sl.registerLazySingleton<RemoveFromFavourites>(
    () => RemoveFromFavourites(repository: sl()),
  );
}
