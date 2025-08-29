import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_delivery_app/domain/entities/food_model.dart';
import 'package:food_delivery_app/domain/usecases/get_food_usecase.dart';
import 'package:food_delivery_app/presentation/home/providers/home_states.dart';

class HomeNotifier extends StateNotifier<HomeStates> {
  List<FoodEntity> food = [];
  List<FoodEntity> cart = [];
  final GetFoodUsecase getFoodUsecase;
  HomeNotifier(this.getFoodUsecase) : super(FoodLoading()) {
    foodLoading();
  }

  Future<void> foodLoading() async {
    await Future.delayed(Duration(seconds: 2));

    final foodList = await getFoodUsecase.getFoodUsecase();
    food = foodList;

    state = FoodLoaded();
  }

  void foodSelected(FoodEntity foodItem) {
    final index = cart.indexWhere((item) => item.id == foodItem.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
    } else {
      cart.add(foodItem.copyWith(quantity: 1));
    }
    state = FoodLoaded();
  }

  void foodDiscarded(FoodEntity foodItem) {
    cart.removeWhere((item) => item.id == foodItem.id);
    state = FoodLoaded();
  }

  void incrementQuantity(FoodEntity foodItem) {
    final index = cart.indexWhere((item) => item.id == foodItem.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      state = FoodLoaded();
    }
  }

  void decrementQuantity(FoodEntity foodItem) {
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
  final usecase = ref.watch(usecaseProvider);
  return HomeNotifier(usecase);
});

final selectionProvider = StateProvider<Set<int>>((ref) => {});

final cartCountProvider = Provider<int>((ref) {
  final notifier = ref.watch(foodProvider.notifier);
  return notifier.cart.fold(0, (sum, item) => sum + item.quantity);
});
