import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
class Category {
  Id id = Isar.autoIncrement;
  late String categoryId;
  late String name;
  late String thumbUrl;
  late String description;
  late DateTime createdAt;

  Category({
    required this.categoryId,
    required this.name,
    required this.thumbUrl,
    required this.description,
  });
}
