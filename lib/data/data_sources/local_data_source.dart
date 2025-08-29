import 'package:food_delivery_app/data/model/food_model.dart';

class LocalDataSource {
  List<FoodModel> food = [];
  Future<List<FoodModel>> getFoodItems() async {
    return food = [
      FoodModel(
        id: "1",
        name: "Tuna Fish",
        price: 30.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Seafood",
      ),
      FoodModel(
        id: "2",
        name: "Rice & Bread",
        price: 24.0,
        imageUrl: "lib/assets/food/rice.png",
        category: "Staple",
      ),
      FoodModel(
        id: "3",
        name: "Eggs Celery",
        price: 12.0,
        imageUrl: "lib/assets/food/egg.png",
        category: "Healthy",
      ),
      FoodModel(
        id: "4",
        name: "Herby Veg",
        price: 18.0,
        imageUrl: "lib/assets/food/herby.png",
        category: "Veg",
      ),
      FoodModel(
        id: "5",
        name: "Biryani",
        price: 35.0,
        imageUrl: "lib/assets/food/sushi.png",
        category: "Indian",
      ),
      FoodModel(
        id: "6",
        name: "Paneer Masala",
        price: 28.0,
        imageUrl: "lib/assets/food/pasta.png",
        category: "Indian",
      ),
      FoodModel(
        id: "7",
        name: "Caesar Salad",
        price: 15.0,
        imageUrl: "lib/assets/food/egg.png",
        category: "Salad",
      ),
      FoodModel(
        id: "8",
        name: "Pizza",
        price: 40.0,
        imageUrl: "lib/assets/food/herby.png",
        category: "Pizza",
      ),
      FoodModel(
        id: "9",
        name: "Cold Coffee",
        price: 10.0,
        imageUrl: "lib/assets/food/sushi.png",
        category: "Beverage",
      ),
      FoodModel(
        id: "10",
        name: "Chocolate Cake",
        price: 20.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Dessert",
      ),
    ];
  }
}
