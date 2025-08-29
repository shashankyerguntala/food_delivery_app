import 'package:food_delivery_app/domain/repository/cart_item_repository.dart';

abstract class GetCartUsecase {
  final CartItemRepository cartItemRepository;

  GetCartUsecase({required this.cartItemRepository});
  Future<void> getCartItems() {
    return cartItemRepository.;
  }
}
