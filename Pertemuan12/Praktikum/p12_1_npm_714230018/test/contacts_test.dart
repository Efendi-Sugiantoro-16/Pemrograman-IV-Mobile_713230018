// Test untuk aplikasi Contacts API
// 
// Test ini memverifikasi bahwa aplikasi dapat dijalankan dan menampilkan UI yang benar

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:p12_1_npm_714230018/main.dart';

void main() {
  testWidgets('Contacts App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const P12App());

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify that app title is displayed
    expect(find.text('Contacts API (Praktikum P12)'), findsOneWidget);
    
    // Verify that input fields are present
    expect(find.byType(TextFormField), findsWidgets);
    
    // Verify that buttons are present
    expect(find.byType(ElevatedButton), findsWidgets);
    
    // Verify that the list contact title is displayed
    expect(find.text('List Contact'), findsOneWidget);
    
    // Verify that POST button exists
    expect(find.text('POST'), findsOneWidget);
    
    // Verify that Refresh Data button exists
    expect(find.text('Refresh Data'), findsOneWidget);
    
    // Verify that Reset button exists
    expect(find.text('Reset'), findsOneWidget);
  });
}
