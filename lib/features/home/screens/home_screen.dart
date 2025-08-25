import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/features/home/home_widgets/floating_cart_button.dart';
import 'package:food_delivery_app/features/home/home_widgets/food_card.dart';
import 'package:food_delivery_app/features/home/home_widgets/home_appbar.dart';
import 'package:food_delivery_app/features/home/providers/home_notifier.dart';
import 'package:food_delivery_app/features/home/providers/home_states.dart';
import 'package:food_delivery_app/features/my_orders/screens/myorder.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(foodProvider);
    final foodList = ref.watch(foodProvider.notifier).food;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppbar(),
                const SizedBox(height: 20),
                if (state is FoodLoading)
                  const Center(child: CircularProgressIndicator())
                else if (state is FoodLoaded)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: foodList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.67,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemBuilder: (context, index) {
                      final item = foodList[index];

                      return Padding(
                        padding: EdgeInsets.only(top: index.isOdd ? 26 : 0),
                        child: FoodCard(food: item, index: index),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingCartButton(
        onOrderTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Myorder()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
