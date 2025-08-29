import 'package:food_delivery_app/data/data_sources/local_data_source.dart';
import 'package:food_delivery_app/data/model/food_model.dart';
import 'package:food_delivery_app/domain/repository/get_food_repo.dart';
import 'package:riverpod/riverpod.dart';

class GetFoodRepositoryImpl extends GetFoodRepo {
  @override
  Future<List<FoodModel>> getFoodRepo() {
    return LocalDataSource().getFoodItems();
  }
}

final repoImplPrvoider = StateProvider<GetFoodRepo>(
  (ref) => GetFoodRepositoryImpl(),
);
