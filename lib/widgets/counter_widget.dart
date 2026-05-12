// lib/widgets/counter_widget.dart
//task 1
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/counter_controller.dart';

class CounterWidget extends StatelessWidget {
  final CounterController c = Get.put(CounterController());
  final double widgetHeight=100.0;
  final double widgetWidth=100.0;
   CounterWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.mediaQuery.size.height - widgetHeight - 16, left: 16, right: 16, bottom: 16),
      child: Row(
        children: [

        ElevatedButton(onPressed: c.increment,style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Adjust the radius here
      
    ),
    fixedSize:  Size(widgetWidth, widgetHeight), // Forces it to be a square
  ), child:  const Text('+')),
  const SizedBox(width: 16), // Spacing between buttons
        ElevatedButton(onPressed: c.decrement,style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Adjust the radius here
    ),
    fixedSize:  Size(widgetWidth, widgetHeight), // Forces it to be a square
  ), child: const Text('-')),
  const Spacer(), // Spacing between buttons
        ElevatedButton(onPressed: c.reset,style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Adjust the radius here
    ),
    fixedSize:  Size(widgetWidth, widgetHeight), // Forces it to be a square
  ), child: const Text('reset')),
      ],
    ));
}

}

/*
  @override
  Widget build(BuildContext context) {
    return Obx(() => Text('${c.count.value}'));
    // wrap with buttons — implement after widget tests are red
  }
  */


