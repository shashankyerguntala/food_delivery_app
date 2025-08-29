import 'package:food_delivery_app/domain/entities/food_model.dart';

abstract class CartRepository {
  List<FoodEntity> getCartItems();
  void addToCart(FoodEntity food);
  void removeFromCart(FoodEntity food);

  void incrementQuantity(String id);
  void decrementQuantity(String id);
}
