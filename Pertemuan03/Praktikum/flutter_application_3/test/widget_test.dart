// This is a basic Flutter widget test for BiggerText functionality.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_3/bigger_text.dart';

void main() {
  testWidgets('BiggerText toggle functionality test', (WidgetTester tester) async {
    // Build the BiggerText widget with test text
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: BiggerText(teks: "Hello ULBI"),
          ),
        ),
      ),
    );

    // Verify that initial text is displayed with size 16.0
    expect(find.text('Hello ULBI'), findsOneWidget);
    expect(find.text('Perbesar'), findsOneWidget);
    expect(find.text('Perkecil'), findsNothing);

    // Tap the "Perbesar" button and trigger a frame
    await tester.tap(find.text('Perbesar'));
    await tester.pump();

    // Verify that text size increased and button text changed
    expect(find.text('Hello ULBI'), findsOneWidget);
    expect(find.text('Perbesar'), findsNothing);
    expect(find.text('Perkecil'), findsOneWidget);

    // Tap the "Perkecil" button and trigger a frame
    await tester.tap(find.text('Perkecil'));
    await tester.pump();

    // Verify that text size decreased and button text changed back
    expect(find.text('Hello ULBI'), findsOneWidget);
    expect(find.text('Perbesar'), findsOneWidget);
    expect(find.text('Perkecil'), findsNothing);
  });
}
