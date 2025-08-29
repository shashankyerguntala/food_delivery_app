import 'package:food_delivery_app/data/model/food_model.dart';

abstract class CartItemRepository {
  Future<List<FoodModel>> cart();
}
