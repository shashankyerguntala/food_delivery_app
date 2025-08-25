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

    state = FoodLoaded();
  }

  /// ✅ Add to cart (with quantity handling)
  void foodSelected(FoodModel foodItem) {
    final index = cart.indexWhere((item) => item.id == foodItem.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
    } else {
      cart.add(foodItem.copyWith(quantity: 1));
    }
    state = FoodLoaded(); // refresh UI
  }

  /// ✅ Remove from cart completely
  void foodDiscarded(FoodModel foodItem) {
    cart.removeWhere((item) => item.id == foodItem.id);
    state = FoodLoaded(); // refresh UI
  }

  /// ✅ Increment quantity
  void incrementQuantity(FoodModel foodItem) {
    final index = cart.indexWhere((item) => item.id == foodItem.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      state = FoodLoaded();
    }
  }

  /// ✅ Decrement quantity
  void decrementQuantity(FoodModel foodItem) {
    final index = cart.indexWhere((item) => item.id == foodItem.id);
    if (index != -1 && cart[index].quantity > 1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity - 1);
    } else {
      cart.removeAt(index);
    }
    state = FoodLoaded();
  }
}

final foodProvider = StateNotifierProvider<HomeNotifier, HomeStates>((ref) {
  return HomeNotifier();
});

final selectionProvider = StateProvider<Set<int>>((ref) => {});

/// ✅ Cart count (with total quantities, not just items)
final cartCountProvider = Provider<int>((ref) {
  final notifier = ref.watch(foodProvider.notifier);
  return notifier.cart.fold(0, (sum, item) => sum + item.quantity);
});
