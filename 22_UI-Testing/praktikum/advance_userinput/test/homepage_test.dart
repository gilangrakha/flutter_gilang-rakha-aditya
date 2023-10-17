import 'package:advance_userinput/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage displays date picker and color picker', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Verify that the 'Interactive Widget' title is present
    expect(find.text('Interactive Widget'), findsOneWidget);

    // Verify that the 'Date' label is present
    expect(find.text('Date'), findsOneWidget);

    // Verify that the 'Select' button is present
    expect(find.text('Select'), findsOneWidget);

    // Verify that the 'Color' label is present
    expect(find.text('Color'), findsOneWidget);

    // Verify that the 'Pick Color' button is present
    expect(find.text('Pick Color'), findsOneWidget);

    // Verify that the 'Pick Files' label is present
    expect(find.text('Pick Files'), findsOneWidget);

    // Verify that the 'Pick and Open Files' button is present
    expect(find.text('Pick and Open Files'), findsOneWidget);
  });

  // Add more test cases as needed
}
