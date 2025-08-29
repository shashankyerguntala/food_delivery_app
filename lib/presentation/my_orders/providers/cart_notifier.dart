import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_delivery_app/domain/entities/food_model.dart';
import 'package:food_delivery_app/domain/usecases/get_cart_Usecase.dart';

class CartNotifier extends StateNotifier<List<FoodEntity>> {
  final GetCartItemsUseCase getCartItemsUseCase;
  CartNotifier(this.getCartItemsUseCase) : super([]);

  void add(FoodEntity food) {
    getCartItemsUseCase.addToCart(food);
    state = [...getCartItemsUseCase.getCart()];
  }

  void remove(FoodEntity food) {
    getCartItemsUseCase.removeFromCart(food);
    state = [...getCartItemsUseCase.getCart()];
  }

  void incrementQuantity(String id) {
    getCartItemsUseCase.incrementQuant(id);
    state = [...getCartItemsUseCase.getCart()];
  }

  void decrementQuantity(String id) {
    getCartItemsUseCase.decrementQuant(id);
    state = [...getCartItemsUseCase.getCart()];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<FoodEntity>>((
  ref,
) {
  final getCartItemsUseCase = ref.read(getCartUsecaseProvider);

  return CartNotifier(getCartItemsUseCase);
});
