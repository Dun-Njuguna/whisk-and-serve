import 'package:whisk_and_serve/domain/entities/category.dart';

abstract class RecipeRepositoryInterface {
  Future<List<Category>> getRecipeCategories();
}
