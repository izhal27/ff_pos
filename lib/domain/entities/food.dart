class Food {
  final int? id;
  final String name;
  final int price;
  final String image;
  final String? desc;

  Food({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    this.desc,
  });
}
