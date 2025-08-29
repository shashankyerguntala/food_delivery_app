class FoodEntity {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int quantity;

  FoodEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.quantity = 1,
  });
}
