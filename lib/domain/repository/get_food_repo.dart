import 'package:food_delivery_app/data/model/food_model.dart';

abstract class GetFoodRepo {
  Future<List<FoodModel>> getFoodRepo();
}
