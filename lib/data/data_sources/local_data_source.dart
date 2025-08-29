import 'package:food_delivery_app/domain/entities/food_entity.dart';

class LocalDataSource {
  List<FoodEntity> food = [];
  Future<List<FoodEntity>> getFoodItems() async {
    return food = [
      FoodEntity(
        id: "1",
        name: "Tuna Fish",
        price: 30.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Seafood",
      ),
      FoodEntity(
        id: "2",
        name: "Rice & Bread",
        price: 24.0,
        imageUrl: "lib/assets/food/rice.png",
        category: "Staple",
      ),
      FoodEntity(
        id: "3",
        name: "Eggs Celery",
        price: 12.0,
        imageUrl: "lib/assets/food/egg.png",
        category: "Healthy",
      ),
      FoodEntity(
        id: "4",
        name: "Herby Veg",
        price: 18.0,
        imageUrl: "lib/assets/food/herby.png",
        category: "Veg",
      ),
      FoodEntity(
        id: "5",
        name: "Biryani",
        price: 35.0,
        imageUrl: "lib/assets/food/sushi.png",
        category: "Indian",
      ),
      FoodEntity(
        id: "6",
        name: "Paneer Masala",
        price: 28.0,
        imageUrl: "lib/assets/food/pasta.png",
        category: "Indian",
      ),
      FoodEntity(
        id: "7",
        name: "Caesar Salad",
        price: 15.0,
        imageUrl: "lib/assets/food/egg.png",
        category: "Salad",
      ),
      FoodEntity(
        id: "8",
        name: "Pizza",
        price: 40.0,
        imageUrl: "lib/assets/food/herby.png",
        category: "Pizza",
      ),
      FoodEntity(
        id: "9",
        name: "Cold Coffee",
        price: 10.0,
        imageUrl: "lib/assets/food/sushi.png",
        category: "Beverage",
      ),
      FoodEntity(
        id: "10",
        name: "Chocolate Cake",
        price: 20.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Dessert",
      ),
    ];
  }
}
