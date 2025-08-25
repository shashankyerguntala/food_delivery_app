import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/features/cart/providers/cart_notifier.dart';

import 'package:food_delivery_app/features/my_orders/widgets/food_item_tile.dart';
import 'package:food_delivery_app/features/my_orders/widgets/price_row.dart';

class OrderSummaryCard extends ConsumerWidget {
  final double deliveryFee;

  const OrderSummaryCard({super.key, required this.deliveryFee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartList = ref.watch(cartProvider);

    double itemTotal = 0;
    for (var item in cartList) {
      itemTotal += item.price * item.quantity;
    }

    final tax = cartList.isEmpty ? 0.0 : 1.00;
    final toPay = cartList.isEmpty ? 0.0 : itemTotal + deliveryFee + tax;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cartList.isEmpty
              ? const Center(child: Text("Cart is empty"))
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) => FoodItemTile(
                    name: cartList[index].name,
                    price: cartList[index].price,
                    quantity: cartList[index].quantity,
                    onIncrement: () {
                      ref
                          .read(cartProvider.notifier)
                          .incrementQuantity(cartList[index].id);
                    },
                    onDecrement: () {
                      ref
                          .read(cartProvider.notifier)
                          .decrementQuantity(cartList[index].id);
                    },
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 20),
                ),

          const SizedBox(height: 20),

          PriceRow(
            title: 'Item Total',
            value: '\$ ${itemTotal.toStringAsFixed(2)}',
            showInfo: false,
          ),
          const SizedBox(height: 8),
          PriceRow(
            title: 'Delivery Fee',
            value: '\$ ${deliveryFee.toStringAsFixed(2)}',
            showInfo: true,
          ),
          const SizedBox(height: 8),
          PriceRow(
            title: 'Tax and charges',
            value: '\$ ${tax.toStringAsFixed(2)}',
            showInfo: true,
          ),

          const Divider(height: 28, thickness: 1, color: Colors.black12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "To Pay",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1970),
                ),
              ),
              Text(
                "\$ ${toPay.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1970),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
