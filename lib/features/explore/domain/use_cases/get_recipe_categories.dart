import '../repositories/recipe_repository_interface.dart';
import '../entities/category.dart';

class GetRecipeCategories {
  final RecipeRepositoryInterface repository;

  GetRecipeCategories({required this.repository});

  Future<List<Category>> call() async {
    return await repository.getRecipeCategories();
  }
}
