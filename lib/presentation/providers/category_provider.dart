import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/category_repository.dart';
import '../../data/models/category_model.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/datasources/local_database.dart';

// Provider untuk repository
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final localDatabase = LocalDatabase.instance;
  return CategoryRepositoryImpl(localDatabase);
});

// Provider untuk StateNotifier
final categoryListProvider =
    StateNotifierProvider<CategoryNotifier, List<CategoryModel>>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return CategoryNotifier(categoryRepository);
});

// Notifier untuk mengelola state
class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  final CategoryRepository categoryRepository;

  CategoryNotifier(this.categoryRepository) : super([]) {
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final categories = await categoryRepository.getAllCategories();
    state = categories;
  }

  Future<void> addCategory(CategoryModel category) async {
    await categoryRepository.addCategory(category);
    _fetchCategories();
  }

  Future<void> updateCategory(CategoryModel category) async {
    await categoryRepository.editCategory(category);
    _fetchCategories();
  }

  Future<void> deleteCategory(int id) async {
    await categoryRepository.deleteCategory(id);
    _fetchCategories();
  }
}
