// lib/domain/repositories/food_repository.dart
import 'package:ff_pos/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllCategories();
  Future<int> addCategory(CategoryModel category);
  Future<int> editCategory(CategoryModel category);
  Future<int> deleteCategory(int id);
}
