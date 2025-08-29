import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/data/model/food_model.dart';
import 'package:food_delivery_app/data/repository_impl/get_food_repo_impl.dart';
import 'package:food_delivery_app/domain/repository/food_repository.dart';

class GetFoodUsecase {
  final GetFoodRepo getFoodRepo;

  GetFoodUsecase({required this.getFoodRepo});

  Future<List<FoodModel>> getFoodUsecase() async {
    return await getFoodRepo.getFoodRepo();
  }
}

final usecaseProvider = Provider<GetFoodUsecase>(
  (ref) => GetFoodUsecase(getFoodRepo: ref.watch(repoImplPrvoider)),
);
