// task 4
// Display the shopping cart and allow users to manage their items
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_application_1/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),

      body: Obx(
        () {
          if (cart.items.isEmpty) {
            return const Center(
              child: Text('Cart is empty'),
            );
          }

          return ListView.builder(
            itemCount: cart.items.length,

            itemBuilder: (context, index) {
              final product = cart.items[index];

              return ListTile(
                title: Text(product.name),
              );
            },
          );
        },
      ),
    );
  }
}