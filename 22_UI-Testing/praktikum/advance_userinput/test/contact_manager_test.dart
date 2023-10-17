import 'package:advance_userinput/contact_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Contact Manager Page Test', () {
    testWidgets('Contact Manager Page: Title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactManager()));
      expect(find.text('Contacts'), findsOneWidget);
    });

    testWidgets('Contact Manager Page: Input Fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactManager()));

      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Nomor'), findsOneWidget);

      // Interact with the input fields (example)
      await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
      await tester.enterText(find.byType(TextFormField).at(1), '+1234567890');

      // Add any additional interaction and assertions here
    });

    // Add more tests for Contact Manager Page as needed

    testWidgets('Selection Page: DatePicker', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ContactManager()));

      // Ensure that the DatePicker appears and can be used
      expect(find.text('Select Date, Color, and File'), findsOneWidget);

      // Simulate selecting a date (example)
      await tester.pumpAndSettle();

      // Add assertions for the selected date here
    });

    // Add more tests for Selection Page as needed
  });
}
