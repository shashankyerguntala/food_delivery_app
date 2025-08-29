import 'package:food_delivery_app/data/data_sources/local_data_source.dart';
import 'package:food_delivery_app/domain/entities/food_model.dart';
import 'package:food_delivery_app/domain/repository/food_repository.dart';
import 'package:riverpod/riverpod.dart';

class GetFoodRepositoryImpl extends GetFoodRepo {
  @override
  Future<List<FoodEntity>> getFoodRepo() {
    return LocalDataSource().getFoodItems();
  }
}

final repoImplPrvoider = Provider<GetFoodRepo>(
  (ref) => GetFoodRepositoryImpl(),
);
