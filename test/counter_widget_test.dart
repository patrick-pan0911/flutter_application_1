//task 1
// test/counter_widget_test.dart
import 'package:flutter_application_1/pages/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/widgets/counter_widget.dart';
import 'package:flutter_application_1/controllers/counter_controller.dart';

void main() {
  setUp(() => Get.put(CounterController()));
  tearDown(() => Get.deleteAll());

  group('CounterWidget', () {
    testWidgets('starts at zero', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: CounterPage()));
      expect(find.text('0'), findsOneWidget);
    });


    /*
    testWidgets("Counter incremental stress test", (tester) async {
      // TODO: Implement stress test
      await tester.pumpWidget(GetMaterialApp(home: CounterWidget()));

      for (int i = 1; i < 100; i++) {
        await tester.tap(find.text('+'));
        await tester.pumpAndSettle();
        expect(find.text('$i'), findsOneWidget);
      }
    });

    */

    testWidgets('increments on tap', (tester) async {
      // TODO: pump widget, tap increment button, pumpAndSettle, expect '1'
      // 启动widget
      await tester.pumpWidget(
        GetMaterialApp(
          home: CounterPage(),
        ),
      );

      // press + button
      //print(find.text('+'));
      await tester.tap(find.text('+'));

      // refresh UI
      await tester.pumpAndSettle();

      // check if screen has '1'
      expect(find.text('1'), findsOneWidget);
        });




    testWidgets('does not go below zero', (tester) async {
      // when decrement button is tapped at zero, count should still be zero
      await tester.pumpWidget(
        GetMaterialApp(
          home: CounterPage(),
        ),
      );

        await tester.tap(find.text('-'));

        await tester.pumpAndSettle();

        expect(find.text('0'), findsOneWidget);
          });
    

    testWidgets('decrements on tap', (tester) async {
      // TODO
      await tester.pumpWidget(
        GetMaterialApp(
          home: CounterPage(),
        ),
      );

      // press - button
      await tester.tap(find.text('+'));
      await tester.pumpAndSettle();

      expect(find.text("1"),findsOneWidget);

      await tester.tap(find.text('-'));

      // refresh UI
      await tester.pumpAndSettle();

      // check if screen has '0'
      expect(find.text('0'), findsOneWidget);
        

    });

    testWidgets('resets to zero', (tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: CounterPage(),
        ),
      );

      // press reset button
      await tester.tap(find.text('reset'));

      // refresh UI
      await tester.pumpAndSettle();

      // check if screen has '0'
      expect(find.text('0'), findsOneWidget);
    });

    });
    }