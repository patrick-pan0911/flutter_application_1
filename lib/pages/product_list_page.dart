// task 4
// Display a list of products and allow users to add them to the shopping cart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/models/product.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    final products = [
      const Product(id: '1', name: 'Apple'),
      const Product(id: '2', name: 'Banana'),
      const Product(id: '3', name: 'Orange'),
      const Product(id: '4', name: 'Grapes'),
      const Product(id: '5', name: 'Mango'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            'Cart (${cart.itemCount.value})',
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },

            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: products.length,

        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            title: Text(product.name),

            trailing: ElevatedButton(
              onPressed: () {
                cart.addItem(product);
              },

              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}