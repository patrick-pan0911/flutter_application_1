// lib/controllers/counter_controller.dart
//task 1
import 'package:get/get.dart';

class CounterController extends GetxController {
  // RED: write unit tests for this controller before implementing
  final count = 0.obs;

  void increment() { 
    count.value++;
   }


  void decrement() { 
    if (count.value>0) {
      count.value--;
    }
   }


  void reset()     { 
    count.value=0;
   }
}