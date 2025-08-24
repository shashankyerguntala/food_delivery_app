import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/features/home/home_widgets/food_card.dart';
import 'package:food_delivery_app/features/home/home_widgets/home_appbar.dart';
import 'package:food_delivery_app/features/home/providers/home_notifier.dart';
import 'package:food_delivery_app/features/home/providers/home_states.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox();
    final state = ref.watch(foodProvider);
    final foodList = ref.watch(foodProvider.notifier).food;

    if (state is FoodLoading) {
      content = Center(child: CircularProgressIndicator());
    } else if (state is FoodLoaded) {
      content = Expanded(
        child: GridView.builder(
          itemCount: foodList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) => FoodCard(
            food: foodList[index],
            onTap: () {
              // ref.read(selectionProvider.notifier).state = true;
            },
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [HomeAppbar(), SizedBox(height: 20), content],
          ),
        ),
      ),
    );
  }
}
