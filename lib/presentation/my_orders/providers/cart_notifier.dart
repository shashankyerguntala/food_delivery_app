import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/data/model/food_model.dart';

class CartNotifier extends StateNotifier<List<FoodModel>> {
  CartNotifier() : super([]);

  void add(FoodModel food) {
    final index = state.indexWhere((f) => f.id == food.id);

    if (index == -1) {
      state = [...state, food.copyWith(quantity: 1)];
    } else {
      incrementQuantity(food.id);
    }
  }

  void remove(FoodModel food) {
    state = state.where((f) => f.id != food.id).toList();
  }

  void clear() {
    state = [];
  }

  void incrementQuantity(String id) {
    state = state
        .map(
          (value) => value.id == id
              ? value.copyWith(quantity: value.quantity + 1)
              : value,
        )
        .toList();
  }

  void decrementQuantity(String id) {
    state = state
        .map((f) {
          if (f.id == id) {
            if (f.quantity > 1) {
              return f.copyWith(quantity: f.quantity - 1);
            } else {
              return null;
            }
          }
          return f;
        })
        .whereType<FoodModel>()
        .toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<FoodModel>>((
  ref,
) {
  return CartNotifier();
});
