import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/constants.dart';
import 'package:food_delivery_app/features/cart/providers/cart_notifier.dart';

class FloatingCartButton extends ConsumerStatefulWidget {
  final VoidCallback onOrderTap;

  const FloatingCartButton({super.key, required this.onOrderTap});

  @override
  ConsumerState<FloatingCartButton> createState() => _FloatingCartButtonState();
}

class _FloatingCartButtonState extends ConsumerState<FloatingCartButton> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final count = cart.length;
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(213, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(106, 135, 135, 135),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            color: Constants().titleTextColor,
            size: 26,
          ),
          const SizedBox(width: 8),
          Text(
            " $count Plates in cart",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Constants().titleTextColor,
            ),
          ),
          const SizedBox(width: 20),

          GestureDetector(
            onTap: widget.onOrderTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Constants().titleTextColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                "My Order",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
