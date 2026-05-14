//task 4
import 'package:get/get.dart';
import 'package:flutter_application_1/models/product.dart';

class CartController extends GetxController {
  final items = <Product>[].obs;

  //UI will listen to this variable and update when it changes
  final itemCount = 0.obs;

  //add item to cart and update item count
  void addItem(Product product) {
    items.add(product);

    itemCount.value = items.length;
  }

  //clear cart and reset item count
  void clearCart() {
    items.clear();

    itemCount.value = 0;
  }
}
