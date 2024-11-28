import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ff_pos/data/datasources/local_database.dart';
import 'package:ff_pos/data/models/food_model.dart';
import 'package:ff_pos/data/repositories/food_repository_impl.dart';
import 'package:ff_pos/domain/repositories/food_repository.dart';

// Provider untuk repository
final foodRepositoryProvider = Provider<FoodRepository>((ref) {
  final localDatabase = LocalDatabase.instance;
  return FoodRepositoryImpl(localDatabase);
});

// Provider untuk StateNotifier
final categoryListProvider =
    StateNotifierProvider<FoodNotifier, List<FoodModel>>((ref) {
  final foodRepository = ref.watch(foodRepositoryProvider);
  return FoodNotifier(foodRepository);
});

// Notifier untuk mengelola state
class FoodNotifier extends StateNotifier<List<FoodModel>> {
  final FoodRepository foodRepository;

  FoodNotifier(this.foodRepository) : super([]) {
    _fetchFoods();
  }

  Future<void> _fetchFoods() async {
    final categories = await foodRepository.getAllFoods();
    state = categories;
  }

  Future<void> addFood(FoodModel category) async {
    await foodRepository.addFood(category);
    _fetchFoods();
  }

  Future<void> updateFood(FoodModel category) async {
    await foodRepository.addFood(category);
    _fetchFoods();
  }

  Future<void> deleteFood(int id) async {
    await foodRepository.deleteFood(id);
    _fetchFoods();
  }
}
