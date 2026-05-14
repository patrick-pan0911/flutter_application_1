//task 4
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/models/product.dart';

void main() {
  late CartController controller;

  setUp(() {
    controller = CartController();

    controller.onInit();
  });

  tearDown(() {
    Get.deleteAll();
  });

  group('CartController', () {
    test('starts with empty cart', () {
      expect(controller.items.isEmpty, true);

      expect(controller.itemCount.value, 0);
    });

    test('addItem increases item count', () {
      controller.addItem(
        const Product(
          id: '1',
          name: 'Widget',
        ),
      );

      expect(controller.itemCount.value, 1);
    });

    test('clearCart empties items', () {
      controller.addItem(
        const Product(
          id: '1',
          name: 'Widget',
        ),
      );

      controller.clearCart();

      expect(controller.items.isEmpty, true);

      expect(controller.itemCount.value, 0);
    });

    test('adding same product twice results in count 2', () {
      const product = Product(
        id: '1',
        name: 'Widget',
      );

      controller.addItem(product);

      controller.addItem(product);

      expect(controller.itemCount.value, 2);
    });
  });
}