//task 1
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/widgets/counter_widget.dart';
import 'package:flutter_application_1/controllers/counter_controller.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override

  Widget build(BuildContext context) {
    final CounterController c = Get.put(CounterController());

    return Scaffold(

      body: Stack(

  children: [
    Center(
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Counter App'),
              Text('${c.count.value}'),
            ],
          )),
    ),
 CounterWidget(),
  ],
),
    );
  }
}