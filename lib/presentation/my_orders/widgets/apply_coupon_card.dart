import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/constants.dart';

class ApplyCouponCard extends StatelessWidget {
  const ApplyCouponCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),

            child: Image(image: AssetImage('lib/assets/discount.png')),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              "Apply Coupon",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Constants().titleTextColor,
              ),
            ),
          ),

          Icon(Icons.arrow_forward, color: Constants().titleTextColor),
        ],
      ),
    );
  }
}
