import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/my_orders/widgets/counter_button.dart';

class FoodItemTile extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const FoodItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('lib/assets/veg.png', height: 28, width: 28),
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1970),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Per Plate \$${price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),

        SizedBox(
          width: 100,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(34, 76, 175, 79),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(icon: Icons.remove, onPressed: onDecrement),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "$quantity",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F1970),
                    ),
                  ),
                ),
                CounterButton(icon: Icons.add, onPressed: onIncrement),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        SizedBox(
          width: 70,
          child: Text(
            "\$ ${(price * quantity).toStringAsFixed(2)}",
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1970),
            ),
          ),
        ),
      ],
    );
  }
}
