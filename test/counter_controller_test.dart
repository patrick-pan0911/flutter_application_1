//task 1
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/controllers/counter_controller.dart';

void main() {
  test('CounterController starts at zero', () {
      final controller = CounterController();
      expect(controller.count.value, 0);
    });

  test('CounterController increments',(){
      final controller=CounterController();
      controller.increment();
      expect(controller.count.value,1);
  });

  test('CounterController does not decrement below zero',(){
      final controller=CounterController();
      controller.decrement();
      expect(controller.count.value,0);
  });

  test('CounterController resets to zero', () {
      final controller = CounterController();
      controller.increment();
      controller.reset();
      expect(controller.count.value, 0);
    });
  }

  
