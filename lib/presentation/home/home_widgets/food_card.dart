import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/constants.dart';

import 'package:food_delivery_app/domain/entities/food_model.dart';
import 'package:food_delivery_app/presentation/my_orders/providers/cart_notifier.dart';
import 'package:food_delivery_app/presentation/home/providers/home_notifier.dart';

class FoodCard extends ConsumerWidget {
  final FoodEntity food;
  final int index;
  const FoodCard({super.key, required this.food, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedList = ref.watch(selectionProvider);
    final isSelected = selectedList.contains(index);

    return GestureDetector(
      onTap: () {
        ref.read(selectionProvider.notifier).update((state) {
          final newSet = {...state};
          if (newSet.contains(index)) {
            newSet.remove(index);
            ref.read(cartProvider.notifier).remove(food);
          } else {
            newSet.add(index);
            ref.read(cartProvider.notifier).add(food);
          }
          return newSet;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 176,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: isSelected
                      ? Border.all(color: const Color(0xff37B890), width: 2)
                      : Border.all(color: const Color(0xffE9F3FB), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Image.asset(food.imageUrl, fit: BoxFit.cover),
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            food.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Constants().titleTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Per Plate \$${food.price}",
            style: TextStyle(fontSize: 13, color: Constants().titleTextColor),
          ),
        ],
      ),
    );
  }
}
