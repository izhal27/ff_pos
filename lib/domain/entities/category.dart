class Category {
  final int? id;
  final String name;
  final String image;
  final String? desc;

  Category({
    this.id,
    required this.name,
    required this.image,
    this.desc,
  });
}
