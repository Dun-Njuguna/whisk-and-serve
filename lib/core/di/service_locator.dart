import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whisk_and_serve/data/data_sources/local_data_source.dart';
import 'package:whisk_and_serve/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve/data/repositories/recipe_repository_impl.dart';
import 'package:whisk_and_serve/domain/entities/category.dart';
import 'package:whisk_and_serve/domain/repositories/recipe_repository_interface.dart';
import 'package:whisk_and_serve/domain/use_cases/get_recipe_categories.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  await _registerIsar();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
}

// Initialize and register Isar
Future<void> _registerIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      CategorySchema,
    ],
    directory: dir.path,
  );

  sl.registerSingleton<Isar>(isar);
}

// Register all data sources
void _registerDataSources() {
  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSource(),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(sl<Isar>()),
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
