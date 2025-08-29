import 'package:food_delivery_app/domain/entities/food_model.dart';

abstract class GetFoodRepo {
  Future<List<FoodEntity>> getFoodRepo();
}
