import 'package:whisk_and_serve/features/explore/domain/entities/category.dart';

abstract class RecipeRepositoryInterface {
  Future<List<Category>> getRecipeCategories();
}
