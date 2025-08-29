import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/constants.dart';

import 'package:food_delivery_app/presentation/food_preparing/screens/food_preparing_screen.dart';
import 'package:food_delivery_app/presentation/my_orders/widgets/apply_coupon_card.dart';
import 'package:food_delivery_app/presentation/my_orders/widgets/delivery_address.dart';
import 'package:food_delivery_app/presentation/my_orders/widgets/floatin_button_payment.dart';
import 'package:food_delivery_app/presentation/my_orders/widgets/order_summary.dart';

class Myorder extends ConsumerStatefulWidget {
  const Myorder({super.key});

  @override
  ConsumerState<Myorder> createState() => _MyorderState();
}

class _MyorderState extends ConsumerState<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('lib/assets/plate.png'),
          ),
          Positioned(
            top: 0,
            right: 100,
            child: Image.asset('lib/assets/plate2.png'),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 22,
                                color: Constants().titleTextColor,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Constants().titleTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "My Orders",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Constants().titleTextColor,
                      ),
                    ),
                  ),
                  ApplyCouponCard(),
                  OrderSummaryCard(deliveryFee: 0),
                  DeliveryAddress(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingCartButtonPayment(
        onOrderTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PreparingFoodScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
