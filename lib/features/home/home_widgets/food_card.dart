import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/features/home/providers/home_notifier.dart';

import 'package:food_delivery_app/models/food_model.dart';

class FoodCard extends ConsumerWidget {
  final FoodModel food;

  final VoidCallback onTap;

  const FoodCard({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    // Widget content;
    // final state = ref.watch(selectionProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffE9F3FB)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Image(
                    image: AssetImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                food.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Per Plate \$${food.price}",
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
            ],
          ),

          // if (true)
          //   const Positioned(
          //     top: 8,
          //     right: 8,
          //     child: CircleAvatar(
          //       radius: 14,
          //       backgroundColor: Colors.green,
          //       child: Icon(Icons.check, size: 16, color: Colors.white),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
