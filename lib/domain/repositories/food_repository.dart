// lib/domain/repositories/food_repository.dart
import 'package:ff_pos/data/models/food_model.dart';

abstract class FoodRepository {
  Future<List<FoodModel>> getAllFoods();
  Future<int> addFood(FoodModel food);
  Future<int> editFood(FoodModel food);
  Future<int> deleteFood(int id);
}
