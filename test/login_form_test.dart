//task 2
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/widgets/login_form.dart';

void main() {
  testWidgets('Login button exists', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets(
  'shows validation errors when fields are invalid',
  (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(),
        ),
      ),
    );

    await tester.tap(find.text('Login'));

    await tester.pump();

    expect(find.text('Email is required'), findsOneWidget);

    expect(find.text('Password is required'), findsOneWidget);
  },
);

  testWidgets(
  'shows Submitted when form is valid',
  (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(),
        ),
      ),
    );

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'user@example.com',
    );

    await tester.enterText(
      find.byType(TextFormField).at(1),
      '12345678',
    );

    await tester.tap(find.text('Login'));

    await tester.pump();

    expect(find.text('Submitted'), findsOneWidget);
  },
);
}