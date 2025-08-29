import 'package:food_delivery_app/data/model/food_model.dart';

abstract class CartRepository {
  List<FoodModel> getCartItems();
  void addToCart(FoodModel food);
  void removeFromCart(FoodModel food);

  void incrementQuantity(String id);
  void decrementQuantity(String id);
}
