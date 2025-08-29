import 'package:food_delivery_app/domain/entities/food_model.dart';

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
}
