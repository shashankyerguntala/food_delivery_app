import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/data/model/food_model.dart';
import 'package:food_delivery_app/domain/repository/cart_repository.dart';

class GetCartRepositoryImpl implements CartRepository {
  final List<FoodModel> cart = [];

  @override
  List<FoodModel> getCartItems() => cart;

  @override
  void addToCart(FoodModel food) {
    final index = cart.indexWhere((f) => f.id == food.id);

    if (index == -1) {
      cart.add(food.copyWith(quantity: 1));
    } else {
      incrementQuantity(food.id);
    }
  }

  @override
  void removeFromCart(FoodModel food) {
    cart.removeWhere((f) => f.id == food.id);
  }

  @override
  void incrementQuantity(String id) {
    final index = cart.indexWhere((f) => f.id == id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
    }
  }

  @override
  void decrementQuantity(String id) {
    final index = cart.indexWhere((f) => f.id == id);
    if (index != -1) {
      if (cart[index].quantity > 1) {
        cart[index] = cart[index].copyWith(quantity: cart[index].quantity - 1);
      } else {
        cart.removeAt(index);
      }
    }
  }
}

final cartRepoImplPrvoider = Provider<CartRepository>(
  (ref) => GetCartRepositoryImpl(),
);
