import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/category_model.dart';
import '../models/food_model.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();
  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT NOT NULL,
        desc TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE foods (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price INTEGER,
        image TEXT NOT NULL,
        desc TEXT
      )
    ''');
  }

  Future<int> insertCategory(CategoryModel category) async {
    final db = await instance.database;
    return await db.insert('categories', category.toMap());
  }

  Future<int> insertFood(FoodModel food) async {
    final db = await instance.database;
    return await db.insert('foods', food.toMap());
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final db = await instance.database;
    final result = await db.query('categories');
    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<List<FoodModel>> fetchFoods() async {
    final db = await instance.database;
    final result = await db.query('foods');
    return result.map((map) => FoodModel.fromMap(map)).toList();
  }

  Future<int> updateCategory(CategoryModel category) async {
    final db = await instance.database;
    return await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> updateFood(FoodModel food) async {
    final db = await instance.database;
    return await db.update(
      'foods',
      food.toMap(),
      where: 'id = ?',
      whereArgs: [food.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await instance.database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteFood(int id) async {
    final db = await instance.database;
    return await db.delete('foods', where: 'id = ?', whereArgs: [id]);
  }
}
