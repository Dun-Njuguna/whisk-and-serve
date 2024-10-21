import 'package:isar/isar.dart';
import 'package:whisk_and_serve/data/models/category_model.dart';
import 'package:whisk_and_serve/domain/entities/category.dart';

class LocalDataSource {
  final Isar isar;

  LocalDataSource(this.isar);

  // Fetch cached categories
  Future<List<Category>> getCachedCategories() async {
    final cachedCategories = await isar.categorys.where().findAll();
    return cachedCategories;
  }

  // Cache categories
  Future<void> cacheCategories(List<CategoryModel> categories) async {
    await isar.writeTxn(() async {
      for (var categoryModel in categories) {
        final newCategory = Category(
          categoryId: categoryModel.idCategory,
          name: categoryModel.strCategory,
          thumbUrl: categoryModel.strCategoryThumb,
          description: categoryModel.strCategoryDescription,
        )..createdAt = DateTime.now();

        await isar.categorys.put(newCategory);
      }
    });
  }

  // Clear expired categories based on a defined expiry duration
  Future<void> clearExpiredCategories(Duration expiryDuration) async {
    final expiryDate = DateTime.now().subtract(expiryDuration);

    await isar.writeTxn(() async {
      await isar.categorys.filter().createdAtLessThan(expiryDate).deleteAll();
    });
  }
}
