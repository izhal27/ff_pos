import 'package:ff_pos/data/datasources/local_database.dart';
import 'package:ff_pos/data/models/category_model.dart';
import 'package:ff_pos/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final LocalDatabase db;

  CategoryRepositoryImpl(this.db);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return db.fetchCategories();
  }

  @override
  Future<int> addCategory(CategoryModel category) async {
    return db.insertCategory(category);
  }

  @override
  Future<int> editCategory(CategoryModel category) {
    return db.updateCategory(category);
  }

  @override
  Future<int> deleteCategory(int id) {
    return db.deleteCategory(id);
  }
}
