class CategoryModel {
  final int? id;
  final String name;
  final String image;
  final String desc;

  CategoryModel({
    this.id,
    required this.name,
    required this.image,
    required this.desc,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'desc': desc,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      desc: map['desc'],
    );
  }
}
