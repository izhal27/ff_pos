import 'package:ff_pos/data/datasources/local_database.dart';
import 'package:ff_pos/data/models/food_model.dart';
import 'package:ff_pos/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  static final db = LocalDatabase.instance;

  @override
  Future<List<FoodModel>> getAllFoods() {
    return db.fetchFoods();
  }

  @override
  Future<int> addFood(FoodModel food) {
    return db.insertFood(food);
  }

  @override
  Future<int> editFood(FoodModel food) {
    return db.updateFood(food);
  }

  @override
  Future<int> deleteFood(int id) {
    return db.deleteFood(id);
  }
}
