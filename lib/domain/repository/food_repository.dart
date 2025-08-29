import 'package:food_delivery_app/domain/entities/food_entity.dart';

abstract class GetFoodRepo {
  Future<List<FoodEntity>> getFoodRepo();
}
