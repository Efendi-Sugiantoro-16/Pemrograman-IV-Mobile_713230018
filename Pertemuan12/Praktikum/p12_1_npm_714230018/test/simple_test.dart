// Test sederhana untuk aplikasi Contacts API
// Test ini memverifikasi UI dasar tanpa API calls

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:p12_1_npm_714230018/main.dart';

void main() {
  testWidgets('Contacts App Basic UI Test', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const P12App());

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify app title
    expect(find.text('Contacts API (Praktikum P12)'), findsOneWidget);
    
    // Verify input fields exist
    expect(find.byType(TextFormField), findsWidgets);
    
    // Verify buttons exist
    expect(find.byType(ElevatedButton), findsAtLeastNWidgets(1));
    
    // Verify list contact section
    expect(find.text('List Contact'), findsOneWidget);
    
    // Verify input field labels
    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('Nomor HP'), findsOneWidget);
  });
}
