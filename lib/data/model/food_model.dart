import 'package:food_delivery_app/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int quantity;

  FoodModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.quantity = 1,
  }) : super(
         id: id,
         name: name,
         price: price,
         imageUrl: imageUrl,
         category: category,
       );

  FoodModel copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    String? category,
    int? quantity,
  }) {
    return FoodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
    );
  }
}
