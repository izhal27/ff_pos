class FoodModel {
  final int? id;
  final String name;
  final int price;
  final String image;
  final String? desc;

  FoodModel({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    this.desc,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'desc': desc,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      desc: map['desc'],
    );
  }
}
