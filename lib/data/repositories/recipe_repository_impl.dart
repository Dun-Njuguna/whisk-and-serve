import 'package:whisk_and_serve/data/data_sources/remote_data_source.dart';
import 'package:whisk_and_serve/data/models/category_model.dart';
import 'package:whisk_and_serve/domain/entities/category.dart';
import 'package:whisk_and_serve/domain/repositories/recipe_repository_interface.dart';

class RecipeRepositoryImpl implements RecipeRepositoryInterface {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getRecipeCategories() async {
    final categoryModels = await remoteDataSource.getRecipeCategories();
    return categoryModels.map((model) => _mapModelToEntity(model)).toList();
  }
}

// Helper method to map a CategoryModel to a Category entity
Category _mapModelToEntity(CategoryModel model) {
  return Category(
    id: model.idCategory,
    name: model.strCategory,
    thumbUrl: model.strCategoryThumb,
    description: model.strCategoryDescription,
  );
}
