import 'package:flutter/material.dart';

import 'package:food_delivery_app/core/constants/constants.dart';

class FloatingCartButtonPayment extends StatelessWidget {
  final VoidCallback onOrderTap;

  const FloatingCartButtonPayment({super.key, required this.onOrderTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(226, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(106, 151, 151, 151),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('lib/assets/mastercard.png')),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                " Master Card",
                style: TextStyle(
                  fontSize: 16,

                  color: Constants().titleTextColor,
                ),
              ),
              Text(
                "       **** 4035",
                style: TextStyle(
                  fontSize: 16,

                  color: Constants().titleTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),

          GestureDetector(
            onTap: onOrderTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Constants().titleTextColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                "Pay Now",
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
