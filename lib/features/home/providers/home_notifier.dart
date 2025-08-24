import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/features/home/providers/home_states.dart';
import 'package:food_delivery_app/models/food_model.dart';

class HomeNotifier extends StateNotifier<HomeStates> {
  List<FoodModel> food = [];
  List<FoodModel> cart = [];
  HomeNotifier() : super(FoodLoading()) {
    foodLoading();
  }

  Future<void> foodLoading() async {
    await Future.delayed(Duration(seconds: 2));
    food = [
      FoodModel(
        name: "Tuna Fish",
        price: 30.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Seafood",
      ),
      FoodModel(
        name: "Rice & Bread",
        price: 24.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Staple",
      ),
      FoodModel(
        name: "Eggs Celery",
        price: 12.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Healthy",
      ),
      FoodModel(
        name: "Herby Veg",
        price: 18.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Veg",
      ),

      FoodModel(
        name: "Chicken Biryani",
        price: 35.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Indian",
      ),
      FoodModel(
        name: "Paneer Butter Masala",
        price: 28.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Indian",
      ),
      FoodModel(
        name: "Caesar Salad",
        price: 15.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Salad",
      ),
      FoodModel(
        name: "Pepperoni Pizza",
        price: 40.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Pizza",
      ),
      FoodModel(
        name: "Cold Coffee",
        price: 10.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Beverage",
      ),
      FoodModel(
        name: "Chocolate Lava Cake",
        price: 20.0,
        imageUrl: "lib/assets/food/tuna.png",
        category: "Dessert",
      ),
    ];

    state = FoodLoaded();
  }

  void foodSelected(FoodModel food) {
    cart.add(food);
  }

  void foodDiscarded(FoodModel food) {
    cart.remove(food);
  }
}

final foodProvider = StateNotifierProvider<HomeNotifier, HomeStates>((ref) {
  return HomeNotifier();
});

// final selectionProvider = StateProvider<bool>((ref) => false);
