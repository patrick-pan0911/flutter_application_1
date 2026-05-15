// task 4
// Display a list of products and allow users to add them to the shopping cart
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import 'package:flutter_application_1/controllers/cart_controller.dart';
//import 'package:flutter_application_1/models/product.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      'Apple',
      'Banana',
      'Orange',
      'Grapes',
      'Mango',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),

      body: ListView.builder(
        itemCount: products.length,

        itemBuilder: (context, index) {
          final productName = products[index];

          return ListTile(
            title: Text(productName),

            trailing: ElevatedButton(
              onPressed: () {},

              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}