import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/data/model/food_model.dart';
import 'package:food_delivery_app/data/repository_impl/get_cart_repo_impl.dart';
import 'package:food_delivery_app/domain/repository/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository repository;
  GetCartItemsUseCase(this.repository);

  List<FoodModel> getCart() => repository.getCartItems();
  void addToCart(FoodModel food) => repository.addToCart(food);
  void removeFromCart(FoodModel food) => repository.removeFromCart(food);
  void incrementQuant(String id) => repository.incrementQuantity(id);
  void decrementQuant(String id) => repository.decrementQuantity(id);
}

final getCartUsecaseProvider = Provider((ref) {
  final cartRepoImpl = ref.read(cartRepoImplPrvoider);
  return GetCartItemsUseCase(cartRepoImpl);
});
